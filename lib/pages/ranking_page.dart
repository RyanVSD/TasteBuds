import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import '../widgets/leaderboard_list.dart';
import '../widgets/bottom_nav_bar.dart';

class RankingPage extends StatelessWidget { // Simplified to StatelessWidget since state isn’t needed
  const RankingPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          // NEW: Back arrow to return to selection page
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellow,
        title: const Text(
          'LeaderBoard',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      
      body: LeaderboardList(
        posts: context.watch<PostModel>().getTopRecipes(10),
      ),
    );
  }
}
