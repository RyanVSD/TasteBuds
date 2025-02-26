import 'package:flutter/material.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/model/objects/post.dart';
import './widget/post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).brightness == Brightness.dark ?Theme.of(context).colorScheme.surface :Theme.of(context).colorScheme.secondary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 0;
                    });
                  },
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontSize:18,
                      fontWeight:
                          (page == 0) ? FontWeight.w700 : FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )),
              const SizedBox(width: 50),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 1;
                    });
                  },
                  child: Text(
                    "Following",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          (page == 1) ? FontWeight.bold : FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
        body: <Widget>[
          PostGrid(posts: dummyPosts),
          PostGrid(posts: List.from(dummyPosts)..shuffle()),
        ][page]);
  }
}

class PostGrid extends StatelessWidget {
  final List<Post> posts;

  const PostGrid({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    double itemWidth =
        (MediaQuery.of(context).size.width / 2) - 12; // Adjust width
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height:10),
          Center(
              child: Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            children: List.generate(posts.length, (index) {
              Post post = posts[index];
              return SizedBox(
                width: itemWidth, // Ensures 2 columns
                child: CardWidget(post: post),
              );
            }),
          )),
          SizedBox(height:35),
        ],
      ),
    );
  }
}

