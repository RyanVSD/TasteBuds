import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import './widget/recc_card.dart';
// import 'package:tastebuds/model/dummy_data.dart';

class ReccPage extends StatelessWidget {
  const ReccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor:Theme.of(context).brightness == Brightness.dark ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.secondary,
        title: Text(
              "Recommendation",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 4),
          // ReccRow(title: "For you", posts: context.watch<PostModel>().getPostList(5)),
          // ReccRow(title: "Nearest", posts: dummyPosts),
          // ReccRow(title: "Training diet", posts: dummyPosts),
          // ReccRow(title: "Chinese", posts: dummyPosts),
          // ReccRow(title: "Japanese", posts: dummyPosts),
        ],
      )
    );
    // return Placeholder();
  }
}
