import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:tastebuds/service/auth_service.dart';
import './user_service.dart';

Future<List<Post?>> getPosts(int limit) async {
  try {
    final firstRequest = ModelQueries.list<Post>(Post.classType, limit: limit);
    final firstResult = await Amplify.API.query(request: firstRequest).response;
    final firstPageData = firstResult.data;
    return firstPageData?.items ?? <Post?>[];
  } on ApiException catch (e) {
    safePrint("Error fetching posts: $e");
    return const [];
  }
}

Future<List<Post?>> getUserPost(String userId, int limit) async {
  String userId = await AuthService.getUserId();
  try {
    final postQuery = Post.AUTHOR.eq(userId);
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

Future<Post?> getPost(String? postId) async {
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

Future<bool> updatePostRating(String? postId, int tasteRating, int diffRating) async{
 String userId = await AuthService.getUserId();
  try {
    final query1 = CompletedRecipe.RECIPE.eq(postId);
    final query2 = CompletedRecipe.USER.eq(userId).and(query1);
    final request = ModelQueries.list<CompletedRecipe>(CompletedRecipe.classType, where: query2);
    final res = await Amplify.API.query(request: request).response;

    if (res.data != null && res.data!.items.isNotEmpty) {
      final post = res.data!.items.first;
      final newPost = post!.copyWith(tasteRating: tasteRating, difficultyRating: diffRating);
      Amplify.API.mutate(request: ModelMutations.update(newPost));
      return Future.value(true);
    }else {
      return Future.value(false);
    }
    // print(response.data);
  } on ApiException catch (e) {
    safePrint("error fetching post: $e");
    return Future.value(true);
  }
  
}

void createPostRating(Post? post, int tasteRating, int diffRating) async{
  User? user = await getCurrentUser();
  try {
    final CompletedRecipe recipe = CompletedRecipe(
        user: user,
        recipe: post,
        difficultyRating: diffRating, 
        tasteRating: tasteRating
    );
    final request = ModelMutations.create(recipe);
    await Amplify.API.mutate(request: request).response;
    // print(response.data);
  } on ApiException catch (e) {
    safePrint("error fetching post: $e");
    return null;
  }
}

Future<Map<String, int>?> getPostRating(String? postId) async {
  String userId = await AuthService.getUserId();
  try {
    final query1 = CompletedRecipe.RECIPE.eq(postId);
    final query2 = CompletedRecipe.USER.eq(userId).and(query1);
    final request = ModelQueries.list<CompletedRecipe>(CompletedRecipe.classType, where: query2);
    final response = await Amplify.API.query(request: request).response;

    var map = <String, int>{"taste": 0, "difficulty": 0};
    if (response.data != null && response.data!.items.isNotEmpty) {
      map = <String, int>{
        "taste": response.data!.items.first!.tasteRating
      , "difficulty": response.data!.items.first!.difficultyRating};
    }

    return Future.value(map);
    
  } on ApiException catch (e) {

    safePrint("Error fetching posts: $e");
    return Future.value(null);
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
