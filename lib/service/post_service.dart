import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tastebuds/model/amplify/ModelProvider.dart';
import 'package:tastebuds/model/objects/ingredient_item.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'dart:convert';

import 'package:tastebuds/service/database_service.dart';

// or return a map or something like this
Future<PostItem?> getPost(String postId) async {
  Post? response = await Database.getPost(postId);
  if (response == null) {
    print("error getting post $postId");
    return PostItem.empty();
  }
  PostItem lePost = postToPostItem(response);

  return lePost;
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

Future<String> getS3Url(String imPath) async {
  try {
    final result = await Amplify.Storage.getUrl(
      path: StoragePath.fromString(imPath),
    ).result;
    //safePrint('url: ${result.url.toString()}');
    return result.url.toString();
  } on StorageException catch (e) {
    safePrint("image not found: $e");
    return defaultImPath;
  }
}
