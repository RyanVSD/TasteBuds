
class Post {
  String _postId = "0";
  String _title = "untitled";
  String _imageUrl = "";
  List<String> _ingredient = List.empty();
  List<String> _step = List.empty();
  Map<String, int> _rating = {
    "difficulty":0,
    "taste":0,
    "price":0,
  };

  String get getPostId { return _postId;}
  set setPostId( String id) { _postId = id;}

  String get getTitle { return _title;}
  set setTitle( String title) { _title = title;}

  String get getImageUrl { return _imageUrl;}
  set setImageUrl( String url) { _imageUrl = url;}

  List<String> get getIngredient { return _ingredient;}
  set setIngredient( List<String> list) { _ingredient = list;}

  List<String> get getStep { return _step;}
  set setStep( List<String> step) { _step = step;}

  Map<String, int> get getRating { return _rating;}
  set setRating( Map<String, int> rating) { _rating = rating;}

}