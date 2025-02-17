import 'package:flutter/material.dart';

import './account_page.dart';
import './post_page.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/model/post.dart';
import '/widgets/bottom_nav_bar.dart';


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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.yellow[700],
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
                      color: Colors.black,
                      fontWeight:
                          (page == 0) ? FontWeight.bold : FontWeight.normal,
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
                      color: Colors.black,
                      fontWeight:
                          (page == 1) ? FontWeight.bold : FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: AddPostButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.78,
            children: List.generate(dummyPosts.length, (index) {
              Post post = dummyPosts[index];
              return Card(
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
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'By ${post.author}',
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
                                  Text('${post.likes} Likes'),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.favorite,
                                      size: 16, color: Colors.red),
                                  const SizedBox(width: 4),
                                  Text('${post.favorites} Favorites'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Center(
            child: Text(page.toString()),
          )
        ][page]);

  }
}
