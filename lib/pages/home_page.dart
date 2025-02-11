import 'package:flutter/material.dart';
import './account_page.dart';
import './post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('This is the home page',
              textDirection: TextDirection.ltr),
        ),
        body: Center(
            child: Column(
              children: [
                ElevatedButton(
                    child:
                        const Text('Account', textDirection: TextDirection.ltr),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountPage()),
                      );
                    }),
                ElevatedButton(
                    child:
                        const Text('Post', textDirection: TextDirection.ltr),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostPage()),
                      );
                    }),
              ],
            )));
  }
}
