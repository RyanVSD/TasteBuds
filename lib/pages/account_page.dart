import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('This is account page',
                textDirection: TextDirection.ltr)),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text('Back button', textDirection: TextDirection.ltr)),
        ));
  }
}
