import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/widget/content.dart';

class PostPage extends StatelessWidget
{
  const PostPage({super.key});

  @override
   Widget build(BuildContext context) {
    final post = context.watch<PostModel>().post;

    return Scaffold(
      body: Stack(
        children: [
          /// Background Image (Parallax Effect)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 400, // Fixed height for the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    post?.imageUrl ??
                        "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.6, // Starts below the image
            minChildSize: 0.6,
            maxChildSize: 0.85, 
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(20),
                  child: Content(),
                ),
              );
            },
          ),

                    /// Back Button on Top of Image
          Positioned(
            top: kToolbarHeight / 2,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

