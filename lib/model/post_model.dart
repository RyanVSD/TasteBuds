import 'package:flutter/material.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/service/database_service.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post_item.dart';

class PostModel extends ChangeNotifier {
  PostItem? post;
  PostModel();

  Future<void> setPost({required String postId}) async {
    post = await service.getPost(postId);
    notifyListeners();
  }

  static Future<List<PostItem?>> getPostList(int listSize) async {
    List<Post?> apiResponse = await Database.getPosts(listSize);
    List<PostItem?> posts = service.postsToPostItems(apiResponse);
    return posts;
    // temp code, real code do a sql search that returns a list
    //return dummyPosts.sublist(0, listSize);
  }
}
