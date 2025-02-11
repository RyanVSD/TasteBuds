
import 'package:flutter/material.dart';
import 'package:tastebuds/exceptions/invalid_post.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post_obj.dart';

Future<Post> getPost(String postId) async {
  Post? post = await service.getPost(postId);
  if (post == null) throw InvalidPost("invalid post id");
  return post;
}

class PostModel extends ChangeNotifier{
    Post? post;
    PostModel({this.post});

    void setPost({required String postId}) async{
      post = await service.getPost(postId);
      notifyListeners();
    }
}