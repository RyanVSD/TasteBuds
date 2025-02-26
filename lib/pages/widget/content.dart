import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/objects/post.dart';
import 'package:tastebuds/model/post_model.dart';
import './step.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {

  bool isLiked = false;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    Post post = context.watch<PostModel>().post ?? Post.empty();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(
          post.title,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          post.author,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Difficulty: ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ...List.generate(post.ratings["difficulty"] ?? 0, (e) {
                  return Icon(Icons.star, color: Color(0xFFFBC02E));
                }),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5), 
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer, 
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.thumb_up : Icons.thumb_up_off_alt,
                      color: isLiked ? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorited ? Icons.star : Icons.star_border,
                      color: isFavorited ? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.onSurface ,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 8),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24, // Golden color
              ),
            ),
            SizedBox(height: 8),
            ...post.ingredients.map((ing) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "- $ing",
                style: TextStyle(fontSize: 16),
              ),
            )),
            SizedBox(height: 16),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( "Steps",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            ...post.steps.map((step) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: StepCard(step:step),
            )),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
