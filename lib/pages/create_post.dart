import 'package:flutter/material.dart';
import 'package:tastebuds/widgets/bottom_nav_bar.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Center(child: Text("Create Post Here")));
  }
}
