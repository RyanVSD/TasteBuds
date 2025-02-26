import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/widget/content.dart';

class PostPage extends StatefulWidget
{
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isFollowed = false;
  String postImg = "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=";
  String profileImg = 'https://www.shutterstock.com/image-photo/hiking-switzerland-interlaken-jungfrau-region-600nw-2272449171.jpg';

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
                    postImg,
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
                  color: Theme.of(context).colorScheme.surface,
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

          Positioned(
            top: kToolbarHeight / 2,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), 
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer, 
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Profile pic
                   CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(profileImg,),
                  ),
                  SizedBox(width: 10,),
                  // Follow btn
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: isFollowed ? Theme.of(context).colorScheme.tertiaryFixedDim : Theme.of(context).colorScheme.secondary,
                    child: IconButton(
                      icon: isFollowed ? 
                        Icon(Icons.remove, color: const Color(0xFF000000)) : Icon(Icons.add, color: const Color(0xFF000000)),
                      onPressed: () {
                        setState(() {
                          isFollowed = !isFollowed;
                        });
                      },
                      iconSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

