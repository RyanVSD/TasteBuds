import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/model/post_model.dart';

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PostItem post = context.watch<PostModel>().post ?? PostItem.empty();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Center(
          child: Column(
            children: [
              Text("Ingredients",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ...post.ingredients.map((ing) => Text(ing.toString())),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Text("Steps",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ...post.steps.map((ing) => Text(ing))
            ],
          ),
        ),
        Row(
          children: [
            Text("Difficulty: "),
            ...List.generate(post.difficulty.toInt(), (e) => Text("★"))
          ],
        ),
      ],
    );
  }
}
