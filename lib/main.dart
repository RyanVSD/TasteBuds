import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart'; // Keep this import
import './pages/home_page.dart'; // Keep this import
import 'package:provider/provider.dart'; // Add this import
import './pages/ranking_page.dart'; // Add this import

void main() {
  runApp(const MyAppRoot()); // NEW: Rename MyApp to MyAppRoot and wrap it in MultiProvider
}

class MyAppRoot extends StatelessWidget { // NEW: Rename MyApp to MyAppRoot
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // NEW: Provide PostModel at the root level
      providers: [
        ChangeNotifierProvider(create: (context) => PostModel()),
      ],
      child: const MyApp(), // NEW: Wrap the original MyApp in MultiProvider
    );
  }
}

class MyApp extends StatelessWidget { // Keep as is, but now it’s a child of MultiProvider
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow, // Yellow theme as requested
        scaffoldBackgroundColor: Colors.white, // White background
      ),
      home: HomePage(),
    );
  }
}