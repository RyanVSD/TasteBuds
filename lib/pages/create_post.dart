import 'package:flutter/material.dart';
import 'package:tastebuds/widgets/bottom_nav_bar.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Center(child: Text("I love lebron")));
  }
}
