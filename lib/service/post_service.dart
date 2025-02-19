
import 'package:tastebuds/model/objects/post.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'dart:convert';

String tempGetDummyJson(String postId) {
  int id = int.parse(postId);
  if (id >= dummyPosts.length || id < 0) return "{}";
  return jsonEncode(dummyPosts[int.parse(postId)]);
}

// or return a map or something like this
Future<Post?> getPost(String postId) async {
  
  String jsonData = tempGetDummyJson(postId);
  Map<String, dynamic> jsonMap = json.decode(jsonData);
  return jsonMap.isEmpty ?  Post.empty() : Post.fromJson(jsonMap);
}

