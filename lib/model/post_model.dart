
import 'package:flutter/material.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post.dart';

class PostModel extends ChangeNotifier{
    Post? post;
    PostModel();

    void setPost({required String postId}) async{
      post = await service.getPost(postId);
      notifyListeners();
    }

    List<Post?> getPostList(int listSize) {
      // temp code, real code do a sql search that returns a list
      return dummyPosts.sublist(0, listSize);
    }
}