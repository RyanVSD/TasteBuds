import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart';
import './pages/post_page.dart';
import './pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PostModel())],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
