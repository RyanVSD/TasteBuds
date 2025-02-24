import 'package:flutter/material.dart';
import './widget/recc_card.dart';
import 'package:tastebuds/model/dummy_data.dart';

class ReccPage extends StatelessWidget {
  const ReccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(
              "Recommendation",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800
              ),
            ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 4),
          ReccRow(title: "For you", posts: dummyPosts),
          ReccRow(title: "Nearest", posts: dummyPosts),
          ReccRow(title: "Training diet", posts: dummyPosts),
          ReccRow(title: "Chinese", posts: dummyPosts),
          ReccRow(title: "Japanese", posts: dummyPosts),
        ],
      )
    );
    // return Placeholder();
  }
}
