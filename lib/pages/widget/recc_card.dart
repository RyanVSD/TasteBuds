import 'package:flutter/material.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/service/post_service.dart';
import '../post_page.dart';

class ReccRow extends StatelessWidget {
  final Future<List<PostItem?>> posts;
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
                // fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 5),
          FutureBuilder(
              future: posts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('...');
                } else {
                  List<PostItem?> postItems = snapshot.data!;
                  return SizedBox(
                    height: 180,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      SizedBox(
                        width: 8,
                      ),
                      ...List.generate(
                          postItems.length < 7 ? postItems.length : 7, (index) {
                        PostItem post = postItems[index]!;
                        return SizedBox(
                          width: cardWidth, // Ensures 2 columns
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: ReccCard(post: post),
                          ),
                        );
                      }),
                      SizedBox(
                        width: 8,
                      ),
                    ]),
                  );
                }
              }),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      post: post,
                    )));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            FutureBuilder<String>(
                future: getS3Url(post.imageUrl),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData ||
                      snapshot.data!.isEmpty) {
                    return Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Container(
                      height: 100,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data ??
                              "https://placehold.co/600x400?text=Error"),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
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
