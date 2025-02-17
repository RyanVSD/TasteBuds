
import 'package:flutter/material.dart';
import 'package:tastebuds/exceptions/invalid_post.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post_obj.dart';

class PostModel extends ChangeNotifier{
    Post? post;
    PostModel();

    void setPost({required String postId}) async{
      post = await service.getPost(postId);
      notifyListeners();
    }
}