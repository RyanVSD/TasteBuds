
class Post {
  String postId;
  String title;
  String author;
  String imageUrl;
  List<String>? ingredient;
  List<String>? step;
  Map<String, int>? rating;
/*
   {
    "difficulty":0,
    "taste":0,
    "price":0,
    }
*/
  Post.empty(
    {
      this.postId = "0",
      this.title = "untitled",
      this.author = "author",
      this.imageUrl = "https://static.wikia.nocookie.net/fruits-information/images/2/2b/Apple.jpg/revision/latest/thumbnail/width/360/height/450?cb=20180802112257",
      this.ingredient,
      this.step,
      this.rating
    }
  );
  Post(
    {
      required this.postId,
      this.title = "untitled",
      this.author = "author",
      this.imageUrl = "https://static.wikia.nocookie.net/fruits-information/images/2/2b/Apple.jpg/revision/latest/thumbnail/width/360/height/450?cb=20180802112257",
      this.ingredient,
      this.step,
      this.rating 
    }
  );

   factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      ingredient: List<String>.from(json['ingredient']),
      step: List<String>.from(json['step']),
      rating: Map<String, int>.from(json['rating']),
    );
  }
}