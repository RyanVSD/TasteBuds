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

  Future<List<PostItem?>> getPostList(int listSize) async {
    List<Post?> apiResponse = await service.getPosts(listSize);
    List<PostItem?> posts = postsToPostItems(apiResponse);
    for (int i = 0; i < apiResponse.length; i++) {
      Post? post = apiResponse[i];
      if (post != null) {
        List<String> tags = await service.getTags(post);
        posts[i]!.tags = tags;
      }
    }
    return posts;
  }

  Future<List<PostItem?>> getUserPostList(String userId, int listSize) async {
    if (userId == "" ) return Future.value([]);
    List<Post?> apiResponse = await service.getUserPost(userId, listSize);
    List<PostItem?> posts = postsToPostItems(apiResponse);
    return posts;
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

  void setPostRating(String? postId, int taste, int diff) async{

      bool hasPost = await service.updatePostRating(postId, taste, diff);
      if (!hasPost) {
        Post? p = await service.getPost(postId);
        service.createPostRating(p, taste, diff);
      }
  }

  Future<Map<String, int>?> getPostRating(String? postId) async{
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

  
  Future<List<PostItem?>> getRanking(String filter, String dateFilter) async{
    int day = 1;
    if (dateFilter == "3 Days") { day = 3;}
    else if (dateFilter == "1 Week") { day = 7;}
    else if (dateFilter == "1 Month") { day = 30;}

    List<CompletedRecipe?> postList = await service.getPostByDate(DateTime.now().subtract(Duration(hours: day)));
    postList = postList.where((post) => post != null).toList();
    
    if (postList.isNotEmpty) {
      if (filter == "taste") {
        List<CompletedRecipe?> sorted = postList..sort((a, b) => a!.tasteRating.compareTo(b!.tasteRating))
        ..sublist(0, postList.length < 5 ? postList.length : 5);
        return sorted.map((e) => postToPostItem(e!.recipe!)).toList();

      }else if (filter == "diff") {
        List<CompletedRecipe?> sorted = postList..sort((a, b) => a!.difficultyRating.compareTo(b!.difficultyRating))
        ..sublist(0, postList.length < 5 ? postList.length : 5);
        return sorted.map((e) => postToPostItem(e!.recipe!) ).toList();
      }
    } 
    return Future.value([]);
    
  }

}
