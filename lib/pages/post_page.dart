import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/widget/content.dart';

class PostPage extends StatelessWidget
{
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: 
        ListView(
          children: [
            // test button
            ElevatedButton(onPressed: () {
               Navigator.pop(context);
              // context.read<PostModel>().setPost(postId: "1");
            }, child: Text("Back")),
            // Image.imageUrl(File("./static_asset/img1.jpg")),
            Image.network(context.watch<PostModel>().post?.imageUrl??"https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM="),
            Row(
              children: [
                // like, fav, follow buttons
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Content(),
            )
          ],
        ),
    );
  }
}

