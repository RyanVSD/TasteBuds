import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/post_model.dart';
import './post_page.dart';
import 'package:tastebuds/model/dummy_data.dart';
import 'package:tastebuds/model/objects/post.dart';
import '/widgets/bottom_nav_bar.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Ranking"),
        )
      );
  }
}

