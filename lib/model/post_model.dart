import 'package:flutter/material.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/service/post_service.dart' as service;
import 'package:tastebuds/model/objects/post.dart';

class PostModel extends ChangeNotifier {
  Post? post;

  PostModel();

  void setPost({required String postId}) async {
    post = await service.getPost(postId);
    notifyListeners();
  }

  List<Post> getPostList(int listSize) {
    // Temp code, real code do a SQL search that returns a list
    return dummyPosts.sublist(0, listSize);
  }

  List<Post> getTopRecipes(int limit) {
    // Sort all dummy posts by likes (descending) and take the top limit (all are recipes)
    final sortedRecipes = dummyPosts
         // Filter out null posts
        .toList();
    
    sortedRecipes.sort((a, b) => (b.likes).compareTo(a.likes)); // Sort by likes descending
    return sortedRecipes.take(limit).toList();
  }


  void loadRankings() {
    // Optionally fetch or prepare ranking data (e.g., from Amplify or service)
    // For now, this can be empty or used to notify listeners if needed
    notifyListeners();
  }
}