import 'package:flutter/material.dart';

/// A class to represent a Post in the app.
class Post {
  final String id; // Unique identifier for the post
  final String title; // Title of the recipe
  final String author; // Name of the person who shared the recipe
  final String imageUrl; // URL for the post's image
  final List<String> ingredients; // Ingredients for the recipe
  final List<String> steps; // Steps to prepare the recipe
  final int likes; // Number of likes
  final int comments; // Number of comments
  final int favorites; // Number of shares
  final Map<String, double> ratings; // Ratings like taste, difficulty, cheapness

  Post({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    this.likes = 0,
    this.comments = 0,
    this.favorites = 0,
    required this.ratings,
  });
}


