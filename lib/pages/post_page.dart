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
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.yellow[700],
                flexibleSpace: FlexibleSpaceBar(
                  background: context.watch<PostModel>().post != null
                      ? Image.network(
                          context.watch<PostModel>().post?.imageUrl ??
                              "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
                          fit: BoxFit.cover,
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Content()
                ),
            ),
          ),
        ],
      ),
    );
  }
}

