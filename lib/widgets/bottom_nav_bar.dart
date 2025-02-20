import 'package:flutter/material.dart';
import 'package:tastebuds/pages/create_post.dart';
// Adjust these imports to the correct paths in your project:
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),

          // Stats / Analytics Button (Placeholder)
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              // TODO: Implement stats or analytics screen
            },
          ),

          // Spacer for FloatingActionButton
          const SizedBox(width: 40),

          // Menu Button (Placeholder)
          IconButton(
            icon: const Icon(Icons.chat_bubble),
            onPressed: () {
              // TODO: Implement menu or settings
            },
          ),

          // Profile Button
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CreatePost()));
      },
      backgroundColor: Colors.yellow[700],
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
