import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import './widget/post_card.dart';
import 'package:tastebuds/model/post_model.dart';

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
        body: Center(
          child: <Widget>[
            PostGrid(posts: context.watch<PostModel>().getPostList(10)),
            PostGrid(posts: context.watch<PostModel>().getPostList(10)),
          ][page],
        ));
  }
}

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
                    SizedBox(height:10),
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
                    SizedBox(height:35),
                  ],
                );
              }
            }));
  }
}
