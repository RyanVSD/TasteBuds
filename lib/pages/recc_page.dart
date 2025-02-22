import 'package:flutter/material.dart';
import '/widgets/bottom_nav_bar.dart';

class ReccPage extends StatelessWidget {
  const ReccPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: AddPostButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
          child: Text("Reccomendations"),
        ));
  }
}
