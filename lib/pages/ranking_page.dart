import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/amplify/Post.dart';
import 'package:tastebuds/model/objects/post_item.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/post_page.dart';
import 'package:tastebuds/service/post_service.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  String _selectedFilter = '3 Days';
  final List<String> _filterOptions = ['3 Days', '1 Week', '1 Month'];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Taste'),
              Tab(text: 'Difficulty'),
            ],
          ),
          
          actions: [
            DropdownButton<String>(
              value: _selectedFilter,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFilter = newValue!;
                });
              },
              items: _filterOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],

        ),
        body: TabBarView(
          children: [
            FoodPostList(postList: context.read<PostModel>().getRanking("taste", _selectedFilter),), // Taste
            FoodPostList(postList: context.read<PostModel>().getRanking("diff", _selectedFilter),), // Diff
          ],
        ),
      ),
    );
  }
}

class FoodPostList extends StatelessWidget {
  const FoodPostList({super.key, required this.postList});
  final Future<List<PostItem?>> postList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child:CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No posts available'));
        } else {
         List<PostItem?> postItems = snapshot.data!;

        return ListView.builder(
          itemCount: postItems.length, // Example list count
          itemBuilder: (context, index) {
            PostItem? post = postItems[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => PostPage(post: post)));
              },
              child: Card(
                margin: const EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),),
                  clipBehavior: Clip.antiAlias, // Clips the image inside the rounded corners
                  elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image placeholder
                    FutureBuilder<String>(
                    future: getS3Url(post?.imageUrl ?? ""), 
                    builder:(context, snapshot) {
                      if (snapshot.data != null) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data!),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        );
                      }else {
                        return SizedBox(
                          height: 150,
                          child: Center(child: CircularProgressIndicator(),),
                        );
                      }
                    } 
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12,0,12,5),
                      child: Column(
                        children: [
                          Text('#${index + 1} ${post?.title ?? ""}',
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4.0),
                          Text(post?.authorId ?? ""),
                        ],
                      ),
                    ),
                  ],
                ),
                
              ),
            );
          },
        );
      }
  });
  }
}
