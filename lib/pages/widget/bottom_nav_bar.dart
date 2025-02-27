import 'package:flutter/material.dart';

import 'package:tastebuds/pages/create_post.dart';

class BottomNavBar extends StatelessWidget {
  final ValueSetter<int> changePage;
  const BottomNavBar(this.changePage, {super.key});

  @override
    Widget build(BuildContext context) {
      return BottomAppBar(

        color: Theme.of(context).colorScheme.tertiary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home Button
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {changePage(0);},
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart),
              onPressed: () {changePage(1);},
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {changePage(2);},
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreatePost()));
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
