import 'package:flutter/material.dart';
import 'package:tastebuds/pages/ranking_page.dart';
import 'package:tastebuds/pages/recc_page.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentPage = 0;

  void changePage(int page) {
    setState(() {_currentPage = page;});
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Button
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              if (_currentPage != 0){
                changePage(0);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              if (_currentPage != 1){
                changePage(1);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RankingPage()),);
              }
            },
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: const Icon(Icons.thumb_up),
            onPressed: () {
              if (_currentPage != 2){
                changePage(2);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReccPage()),);
              }
            },
          ),

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              if (_currentPage != 3){
                changePage(3);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
              }
            },
          ),
        ],
      ),
    );
  }
}

// Floating Action Button (for Add Post)
class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // TODO: Implement add post functionality
      },
      backgroundColor: Colors.yellow[700],
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
