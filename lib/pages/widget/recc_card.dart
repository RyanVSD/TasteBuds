import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:provider/provider.dart';
import '../post_page.dart';

class ReccRow extends StatelessWidget {
  final List<PostItem> posts;
  final String title;

  const ReccRow({super.key, required this.title, required this.posts});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 170;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 8,),
                  ...List.generate(5, (index) {
                  PostItem post = posts[index];
                  return SizedBox(
                    width: cardWidth, // Ensures 2 columns
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: ReccCard(post: post),
                    ),
                  );
                }),
                SizedBox(width: 8,),
              ]
            ),
          ),
        ],
      ),
    );
  }
}


class ReccCard extends StatelessWidget {
  const ReccCard({
    super.key,
    required this.post,
  });

  final PostItem post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PostModel>().setPost(postId: post.id!);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PostPage(post: post,)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              // width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}