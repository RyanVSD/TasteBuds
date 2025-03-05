import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/service/post_service.dart';
import '../post_page.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.post,
  });

  final PostItem? post;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

final String defaultImPath =
    "https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w=";

class _CardWidgetState extends State<CardWidget> {
  String imUrl = defaultImPath;

  Future<void> getDownloadUrl() async {
    String leUrl = await getS3Url(widget.post!.imageUrl);
    setState(() => imUrl = leUrl);
  }

  @override
  initState() {
    super.initState();
    getDownloadUrl();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(post: widget.post)));
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
                  image: NetworkImage(imUrl),
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
                    widget.post?.title ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'By ${widget.post?.authorId}',
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
                          Text('${widget.post?.likes ?? 0} Likes'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.favorite,
                              size: 16, color: Colors.red),
                          const SizedBox(width: 4),
                          Text('${widget.post?.favorites ?? 0} Favorites'),
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
