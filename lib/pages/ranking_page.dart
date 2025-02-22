import 'package:flutter/material.dart';
import '/widgets/bottom_nav_bar.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: AddPostButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
          child: Text("Ranking"),
        ));
  }
}
