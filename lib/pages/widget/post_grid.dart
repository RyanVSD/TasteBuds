import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import './post_card.dart';


class PostGrid extends StatelessWidget {
  final Future<List<PostItem?>> posts;

  const PostGrid({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    double itemWidth =
        (MediaQuery.of(context).size.width / 2) - 12; // Adjust width
    return SingleChildScrollView(
        child: FutureBuilder<List<PostItem?>>(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No posts available');
              } else {
                List<PostItem?> postItems = snapshot.data!;

                return Column(
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        alignment: WrapAlignment.start,
                        children: List.generate(postItems.length, (index) {
                          PostItem? post = postItems[index];
                          return SizedBox(
                            width: itemWidth, // Ensures 2 columns
                            child: CardWidget(post: post),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 35),
                  ],
                );
              }
            }));
  }
}