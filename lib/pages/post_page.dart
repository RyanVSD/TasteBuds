import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_obj.dart';
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
            //Image.file(File("./static_asset/img1.jpg")),
            Placeholder(color: Color.fromARGB(255, 43, 0, 255),), // Image place holder
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

