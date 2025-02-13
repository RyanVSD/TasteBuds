
import 'package:tastebuds/model/objects/post_obj.dart';
import 'dart:convert';

// or return a map or something like this
Future<Post?> getPost(String postId) async {

    // Example JSON data
  String jsonData = '''
  {
    "postId": "1",
    "title": "Fruit Smoothie",
    "author": "Smoothie master",
    "imageUrl": "https://static.wikia.nocookie.net/fruits-information/images/2/2b/Apple.jpg/revision/latest/thumbnail/width/360/height/450?cb=20180802112257",
    "ingredient": ["1 apple", "4 orange", "3 banana"],
    "step": [
      "1. put one apple",
      "2. put four orange",
      "3. put three banana",
      "4. blend"
    ],
    "rating": {
      "difficulty": 1,
      "price": 2,
      "taste": 4
    }
  }
  ''';

  Map<String, dynamic> jsonMap = json.decode(jsonData);
  Post post = Post.fromJson(jsonMap);
  return post;
}

