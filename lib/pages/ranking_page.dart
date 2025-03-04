import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Price'),
              Tab(text: 'Difficulty'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FoodPostList(), // Price tab
            FoodPostList(), // Difficulty tab
          ],
        ),
      ),
    );
  }
}

class FoodPostList extends StatelessWidget {
  const FoodPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Example list count
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),),
            clipBehavior: Clip.antiAlias, // Clips the image inside the rounded corners
            elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              const Placeholder(fallbackHeight: 150.0),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(12,0,12,5),
                child: Column(
                  children: [
                    Text('#${index + 1} Food',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4.0),
                    const Text('Author'),
                  ],
                ),
              ),
            ],
          ),
          
        );
      },
    );
  }
}
