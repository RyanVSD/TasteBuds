import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/objects/post_obj.dart';
import 'package:tastebuds/model/post_model.dart';

class Content extends StatelessWidget {
  const Content({super.key,});

  @override
  Widget build(BuildContext context) {
    Post post = context.watch<PostModel>().post ?? Post.empty();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.title,
          style: TextStyle(
            fontSize: 32, 
            fontWeight: FontWeight.bold, 
            color: Colors.black,
            ),
        ),
         Text(post.author,
          style: TextStyle(
            fontSize: 24, 
            color: Colors.black,
            ),
        ),
        Center(
          child: Column(
            children: [
              Text("Ingredients", style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              )),
              ...?post.ingredient?.map((ing)=> Text(ing)),
             
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              Text("Steps", style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              )),
              ...?post.step?.map((ing)=> Text(ing))
            ],
          ),
        ),
        Row(
          children: [
            Text("Difficulty: "),
            ...List.generate(post.rating?["difficulty"]??0, (e)=>Text("★"))
          ],
        ),
        Row(
          children: [
            Text("Taste: "),
            ...List.generate(post.rating?["taste"]??0, (e)=>Text("★"))
          ],
        ),
        Row(
          children: [
            Text("Price: "),
            ...List.generate(post.rating?["price"]??0, (e)=>Text("★"))
          ],
        )
      ],
    );
  }
}