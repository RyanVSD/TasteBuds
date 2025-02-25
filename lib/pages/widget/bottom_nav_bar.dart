import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final ValueSetter<int> changePage;
  const BottomNavBar(this.changePage, {super.key});

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
              changePage(0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              changePage(1);
            },
          ),
          const SizedBox(width: 40),
          IconButton(
            icon: const Icon(Icons.thumb_up),
            onPressed: () {
              changePage(2);
            },
          ),

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              changePage(3);
            },
          ),
        ],
      ),
    );
  }
}

// Floating Action Button (for Add Post)
class AddPostButton extends StatelessWidget {
  final ValueSetter<int> changePage;
  const AddPostButton(this.changePage, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        changePage(4);
      },
      backgroundColor: Colors.yellow[700],
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
