import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/pages/create_post.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post_item.dart';

class PostModel extends ChangeNotifier {
  PostItem? post;
  PostModel();

  Future<void> setPost({required String postId}) async {
    post = await getPost(postId);
    notifyListeners();
  }

    
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
    return posts;
  }

  void createPost(PostItem? postItem) {
      if (postItem != null) {
        service.createPost(postItem);
      }else {
        throw ErrorHint("Empty post");
      }
    
  }

  void sendPost(CreatePostFormData data) async {
   
    PostItem createdPost = await PostItem.fromCreateForm(data);
    createPost(createdPost);

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
    );
  }

}
