import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'package:amplify_api/amplify_api.dart';
import './user_service.dart';



Future<List<Post?>> getPosts(int limit) async {
    try {
      final firstRequest =
          ModelQueries.list<Post>(Post.classType, limit: limit);
      final firstResult =
          await Amplify.API.query(request: firstRequest).response;
      final firstPageData = firstResult.data;
      return firstPageData?.items ?? <Post?>[];
    } on ApiException catch (e) {
      safePrint("Error fetching posts: $e");
      return const [];
    }
}

Future<List<Post?>> getOwnPost(int limit) async {
    try {
      User? currentUser = await getCurrentUser();
      if (currentUser == null) throw StateError("Null User");

      final predicate = Post.AUTHOR.eq(currentUser);
      final firstRequest = ModelQueries.list<Post>(Post.classType, limit: limit, where: predicate);
      final firstResult = await Amplify.API.query(request: firstRequest).response;
      final firstPageData = firstResult.data;
      return firstPageData?.items ?? <Post?>[];
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

void createPost(PostItem postItem) async {
  try {
    // Get the user object of the author
    final user = await Amplify.Auth.getCurrentUser();
    final identifier = UserModelIdentifier(id: user.userId);
    final userQuery = ModelQueries.get(User.classType, identifier);
    final userResponse = await Amplify.API.query(request: userQuery).response;
    User? author = userResponse.data;
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