import 'package:flutter/material.dart';
import 'package:tastebuds/pages/account_page.dart';

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
            child: ElevatedButton(
                child:
                    const Text('Open route', textDirection: TextDirection.ltr),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage()),
                  );
                })));
  }
}
