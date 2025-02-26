import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:provider/provider.dart';
import '../post_page.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.post,
  });

  final PostItem? post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PostModel>().setPost(postId: post?.id ?? "0");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PostPage()));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post?.imageUrl ?? ""),
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
                    post?.title ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'By ${post?.authorId}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.thumb_up,
                              size: 16, color: Colors.blue),
                          const SizedBox(width: 4),
                          Text('${post?.likes ?? 0} Likes'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.favorite,
                              size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          Text('${post?.favorites ?? 0} Favorites'),
                        ],
                      ),
                    ],
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
