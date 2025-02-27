import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/pages/widget/content.dart';
import 'package:tastebuds/pages/widget/post_card.dart';
import 'package:tastebuds/service/post_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.post});

  final PostItem? post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String imUrl = defaultImPath;

  Future<void> updImUrl() async {
    PostItem? p = widget.post;
    if (p != null) {
      String newPath = await getS3Url(p.imageUrl);
      setState(() => imUrl = newPath);
    } else {}
  }

  @override
  initState() {
    super.initState();
    updImUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
      ),
      body: ListView(
        children: [
          Image.network(imUrl),
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
