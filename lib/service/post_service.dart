import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:tastebuds/service/auth_service.dart';

Future<List<Post?>> getPosts(int limit) async {
  try {
    final firstRequest = ModelQueries.list<Post>(Post.classType, limit: limit);
    final firstResult = await Amplify.API.query(request: firstRequest).response;
    final firstPageData = firstResult.data;
    for (Post? post in firstPageData?.items ?? []) {}

    return firstPageData?.items ?? <Post?>[];
  } on ApiException catch (e) {
    safePrint("Error fetching posts: $e");
    return const [];
  }
}

Future<List<String>> getTags(Post post) async {
  List<String> tagStrings = [];
  final postTagQuery = PostTag.POST.contains(post.id);
  final postTagRequest =
      ModelQueries.list<PostTag>(PostTag.classType, where: postTagQuery);
  final tagRes = await Amplify.API.query(request: postTagRequest).response;
  for (PostTag? edge in tagRes.data?.items ?? []) {
    if (edge == null) throw StateError("null edge");
    if (edge.tag == null) throw StateError("invalid edge retrieved");
    tagStrings.add(edge.tag!.value);
  }
  return tagStrings;
}

Future<List<Post?>> getOwnPost(int limit) async {
  try {
    String id = await AuthService.getUserId();
    final postQuery = Post.AUTHOR.eq(id);
    final postRequest = ModelQueries.list<Post>(Post.classType, where: postQuery);
    final postResponse = await Amplify.API.query(request: postRequest).response;

    return postResponse.data?.items ?? [];
  } on ApiException catch (e) {
    safePrint("Error fetching posts: $e");
    return const [];
  }
}

Future<String> getS3Url(String imPath) async {
  try {
    final result = await Amplify.Storage.getUrl(
      path: StoragePath.fromString(imPath),
    ).result;
    //safePrint('url: ${result.url.toString()}');
    return result.url.toString();
  } on StorageException catch (e) {
    safePrint("image not found: $e");
    return defaultImPath;
  }
}

Future<Post?> getPost(String postId) async {
  try {
    final queryPredicate = Post.ID.eq(postId);
    final request = ModelQueries.list(Post.classType, where: queryPredicate);
    final response = await Amplify.API.query(request: request).response;
    final posts = response.data?.items;
    if (posts == null) {
      safePrint("Errors: ${response.errors}");
      return null;
    } else {
      return posts[0];
    }
  } on ApiException catch (e) {
    safePrint("error fetching post: $e");
    return null;
  }
}

Future<Tag?> createTag(String tag) async {
  try {
    final toAddTag = Tag(value: tag);
    final request = ModelMutations.create(toAddTag);
    final response = await Amplify.API.mutate(request: request).response;
    return response.data;
  } on ApiException catch (e) {
    safePrint("Error creating tag: $e");
    return null;
  }
}

Future<List<Post>> getPostsByTag(String tag) async {
  try {
    List<Post> psts = [];
    final tagIdentifier = TagModelIdentifier(value: tag);
    final tagQuery = ModelQueries.get<Tag>(Tag.classType, tagIdentifier);
    final tagResponse = await Amplify.API.query(request: tagQuery).response;
    Tag? tagObj = tagResponse.data;
    if (tagObj == null) {
      throw StateError("Error getting tag from db: ${tagResponse.errors}");
    }

    final postTagQuery = PostTag.TAG.contains(tag);
    final postTagRequest =
        ModelQueries.list<PostTag>(PostTag.classType, where: postTagQuery);
    final tagRes = await Amplify.API.query(request: postTagRequest).response;
    List<PostTag?> edges = tagRes.data?.items ?? [];
    for (final edge in edges) {
      if (edge == null) throw StateError("Null edge");
      if (edge.post == null) throw StateError("Edge points to null post");
      psts.add(edge.post!);
    }
    return psts;
  } on ApiException catch (e) {
    safePrint("Error getting posts by tag: $e");
    return [];
  } on StateError catch (e) {
    safePrint(e);
    return [];
  }
}

void createPost(PostItem postItem) async {
  try {
    // Get the user object of the author
    final user = await Amplify.Auth.getCurrentUser();
    final identifier = UserModelIdentifier(id: user.userId);
    final userQuery = ModelQueries.get<User>(User.classType, identifier);
    final userResponse = await Amplify.API.query(request: userQuery).response;
    User? author = userResponse.data;
    safePrint(author);
    if (author == null) {
      throw StateError("no user info: ${userResponse.errors}");
    }

    List<Ingredient> ingredients = postItem.ingredients
        .map((ing) => Ingredient(
            name: ing.getName(),
            value: ing.getValue(),
            unit: Units.values
                .firstWhere((unit) => unit.name == ing.getUnitType())))
        .toList();

    Post post = Post(
      title: postItem.title,
      description: postItem.description,
      imageUrl: postItem.imageUrl,
      steps: postItem.steps,
      likes: 0,
      favorites: 0,
      difficulty: postItem.difficulty.toDouble(),
      uploadTime: TemporalDateTime(postItem.uploadTime),
      price: postItem.price,
      ingredients: ingredients,
      author: author,
    );

    // Create the post mutation
    final request = ModelMutations.create(post);
    final response = await Amplify.API.mutate(request: request).response;
    final createdPost = response.data;

    if (createdPost == null) {
      throw StateError("nuh uh post: ${response.errors}");
    }

    // Now that we have the post id generated by AWS, we can create an associated file path
    // We need to upload the file to that new path, and then update the filePath in the db accordingly

    final postId = createdPost.id;
    final uploadPath = "images/$postId";
    AWSFile file = AWSFile.fromPath(postItem.imageUrl);
    final uploadResult = await Amplify.Storage.uploadFile(
      localFile: file,
      path: StoragePath.fromString(uploadPath),
    ).result;
    safePrint("Uploaded file at: ${uploadResult.uploadedItem.path}");

    // Update file path in post
    final postWithNewFilePath = createdPost.copyWith(imageUrl: uploadPath);
    final updateRequest = ModelMutations.update(postWithNewFilePath);
    final updateResponse =
        await Amplify.API.mutate(request: updateRequest).response;
    final finalPost = updateResponse.data;

    if (finalPost == null) {
      throw StateError("error updating object: ${updateResponse.errors}");
    }

    // Add tags
    List<Future<Tag>> futureTags = postItem.tags.map((e) async {
      final tagQuery = TagModelIdentifier(value: e);
      final tagReq = ModelQueries.get<Tag>(Tag.classType, tagQuery);
      final tagRes = await Amplify.API.query(request: tagReq).response;
      Tag? t = tagRes.data;
      t ??= await createTag(e);
      return t!;
    }).toList();

    List<Tag> tags = await Future.wait(futureTags);

    for (final tag in tags) {
      PostTag edge = PostTag(post: finalPost, tag: tag);
      final createEdge = ModelMutations.create(edge);
      final createEdgeRes =
          await Amplify.API.mutate(request: createEdge).response;
      if (createEdgeRes.data == null) {
        throw StateError(
            "Edge: (Tag, $tag), (Post, $finalPost) was not created");
      }
    }

    // return finalPost;
  } on ApiException catch (e) {
    safePrint("Mutation failed: $e");
    return null;
  } on StateError catch (e) {
    safePrint("Mutation failed: $e");
    return null;
  } on StorageException catch (e) {
    safePrint(e.message);
    return null;
  }
}
