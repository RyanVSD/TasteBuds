import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/pages/create_post.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post_item.dart';

class PostModel extends ChangeNotifier {
  PostItem? post;
  PostModel();

  Future<PostItem?> getPost(String postId) async {
    Post? response = await service.getPost(postId);
    if (response == null) {
      print("error getting post $postId");
      return PostItem.empty();
    }
    PostItem lePost = postToPostItem(response);

    return lePost;
  }

  Future<List<PostItem?>> packagePosts(List<Post?> apiRes) async {
    List<PostItem?> posts = postsToPostItems(apiRes);
    for (int i = 0; i < apiRes.length; i++) {
      Post? post = apiRes[i];
      if (post != null) {
        List<String> tags = await service.getTags(post);
        posts[i]!.tags = tags;
      }
    }
    return posts;
  }

  Future<List<PostItem?>> getPostList(int listSize) async {
    List<Post?> apiResponse = await service.getPosts(listSize);
    return await packagePosts(apiResponse);
  }

  Future<List<PostItem?>> getUserPostList(String userId, int listSize) async {
    if (userId == "") return Future.value([]);
    List<Post?> apiResponse = await service.getUserPost(userId, listSize);
    return await packagePosts(apiResponse);
  }

  Future<List<PostItem?>> getUserPostListContaining(
      String userId, String query) async {
    List<Post?> apiResponse =
        await service.getUserPostsContaining(userId, query);
    return await packagePosts(apiResponse);
  }

  Future<List<PostItem?>> getPostListContaining(String query) async {
    if (query == "") return [];
    List<Post?> apiResponse = await service.getPostsContaining(query);
    return await packagePosts(apiResponse);
  }

  void createPost(PostItem? postItem) {
    if (postItem != null) {
      service.createPost(postItem);
    } else {
      throw ErrorHint("Empty post");
    }
  }

  void sendPost(CreatePostFormData data) async {
    PostItem createdPost = await PostItem.fromCreateForm(data);
    createPost(createdPost);
  }

  void setPostRating(String? postId, int t, int d) async {
    double taste = t.toDouble();
    double diff = d.toDouble();
    bool hasPost = await service.updatePostRating(postId, taste, diff);
    if (!hasPost) {
      Post? p = await service.getPost(postId);
      service.createPostRating(p, taste, diff);
    }
  }

  Future<Map<String, int>?> getPostRating(String? postId) async {
    return service.getPostRating(postId);
  }

  List<PostItem?> postsToPostItems(List<Post?> lst) {
    return lst.map((p) => postToPostItem(p!)).toList();
  }

  PostItem postToPostItem(Post p) {
    return PostItem(
      title: p.title,
      id: p.id,
      authorId: p.author!.username,
      description: p.description,
      uploadTime: p.uploadTime!.getDateTimeInUtc(),
      imageUrl: p.imageUrl,
      steps: p.steps,
      ingredients: p.ingredients
          .map((ing) => IngredientItem.withUnitType(
              value: ing.value,
              name: ing.name,
              unit: UnitType.values.firstWhere((u) => u.name == ing.unit.name)))
          .toList(),
      difficulty: p.difficulty,
      price: p.price,
      likes: p.likes,
      favorites: p.favorites,
      tags: [],
    );
  }

  Future<Map<String, double>> getPublicRatings(String? postId) async {
    Post? post = await service.getPost(postId);
    final recipe = await service.getRecipe(post);
    return {
      "taste": recipe?.tasteRating ?? 0,
      "diff": recipe?.difficultyRating ?? 0
    };
  }

  Future<List<PostItem?>> getRanking(String filter, String dateFilter) async {
    int day = 1;
    if (dateFilter == "3 Days") {
      day = 3;
    } else if (dateFilter == "1 Week") {
      day = 7;
    } else if (dateFilter == "1 Month") {
      day = 30;
    }

    List<CompletedRecipe?> postList = await service
        .getRecipeByDate(DateTime.now().subtract(Duration(days: day)));
    postList = postList.where((post) => post != null).toList();

    if (postList.isNotEmpty) {
      if (filter == "taste") {
        List<CompletedRecipe?> sorted = postList
            .where(
              (e) => e!.tasteRating != 0,
            )
            .toList();
        sorted.sort((a, b) => b!.tasteRating.compareTo(a!.tasteRating));
        sorted = sorted.sublist(0, sorted.length < 5 ? sorted.length : 5);
        return sorted.map((e) {
          PostItem p = postToPostItem(e!.recipe!);
          p.tasteRating = e.tasteRating;
          return p;
        }).toList();
      } else if (filter == "diff") {
        List<CompletedRecipe?> sorted = postList
            .where(
              (e) => e!.difficultyRating != 0,
            )
            .toList();
        sorted
            .sort((a, b) => b!.difficultyRating.compareTo(a!.difficultyRating));
        sorted = sorted.sublist(0, sorted.length < 5 ? sorted.length : 5);
        return sorted.map((e) {
          PostItem p = postToPostItem(e!.recipe!);
          p.diffRating = e.difficultyRating;
          return p;
        }).toList();
      }
    }
    return Future.value([]);
  }
}
