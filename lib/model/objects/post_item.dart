import 'dart:convert';

import 'package:tastebuds/model/objects/ingredient_item.dart';

/// A class to represent a Post in the app.
class PostItem {
  final String id; // Unique identifier for the post
  final String authorId; // Name of the person who shared the recipe

  final String title; // Title of the recipe
  final String description;
  final String imageUrl; // URL for the post's image
  final List<String> steps; // Steps to prepare the recipe

  DateTime uploadTime;

  final int likes; // Number of likes
  final int favorites; // Number of shares
  final int difficulty;

  final double price;

  final List<IngredientItem> ingredients; // Ingredients for the recipe

  PostItem({
    required this.id,
    required this.authorId,
    required this.title,
    required this.description,
    required this.steps,
    required this.uploadTime,
    required this.imageUrl,
    required this.likes,
    required this.favorites,
    required this.difficulty,
    required this.price,
    required this.ingredients,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(
        id: json['id'],
        authorId: json['authorId'],
        title: json['title'],
        description: json['description'],
        steps: List<String>.from(json['steps']),
        uploadTime: DateTime.parse(json['uploadTime']),
        imageUrl: json['imageUrl'],
        likes: json['likes'],
        favorites: json['favorites'],
        difficulty: json['difficulty'],
        price: json['price'],
        ingredients: (jsonDecode(json['ingredients']) as List<dynamic>)
            .map(
                (item) => IngredientItem.fromJson(item as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorId': authorId,
      'title': title,
      'description': description,
      'steps': steps,
      'uploadTime': uploadTime.toIso8601String(),
      'imageUrl': imageUrl,
      'likes': likes,
      'favorites': favorites,
      'difficulty': difficulty,
      'price': price,
      'ingredients': jsonEncode(ingredients),
    };
  }

  PostItem.empty({
    this.id = "0",
    this.authorId = "0",
    this.title = "untitled",
    this.description = "untitled",
    this.steps = const [],
    this.imageUrl =
        "https://static.wikia.nocookie.net/fruits-information/images/2/2b/Apple.jpg/revision/latest/thumbnail/width/360/height/450?cb=20180802112257",
    this.likes = 0,
    this.favorites = 0,
    this.difficulty = 0,
    this.price = 0.0,
    this.ingredients = const [],
  }) : uploadTime = DateTime.now();
}
