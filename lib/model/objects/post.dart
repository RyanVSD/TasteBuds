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
  final Map<String, int>
      ratings; // Ratings like taste, difficulty, cheapness

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

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      ratings: Map<String, int>.from(json['ratings']),
      likes: json['likes'],
      comments: json['comments'],
      favorites: json['favorites']
    );
  }

  Post.empty(
    {
      this.id = "0",
      this.title = "untitled",
      this.author = "author",
      this.imageUrl = "https://static.wikia.nocookie.net/fruits-information/images/2/2b/Apple.jpg/revision/latest/thumbnail/width/360/height/450?cb=20180802112257",
      this.ingredients = const [],
      this.steps = const [],
      this.likes = 0,
      this.comments = 0,
      this.favorites = 0,
      this.ratings = const {}
    }
  );
}
