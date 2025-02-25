import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/post.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'dart:convert';

import 'package:tastebuds/service/database_service.dart';

// or return a map or something like this
Future<PostItem?> getPost(String postId) async {
  Post? response = await Database.getPost(postId);
  if (response == null) {
    print("error getting post $postId");
    return PostItem.empty();
  }
  Map<String, dynamic> responseJson = response.toJson();
  Map<String, dynamic> jsonMap = json.decode(responseJson.toString());
  return PostItem.fromJson(jsonMap);
}
