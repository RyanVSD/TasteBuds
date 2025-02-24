import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/pages/profile_page.dart';
import 'package:tastebuds/pages/ranking_page.dart';
import 'package:tastebuds/pages/recc_page.dart';
import './pages/home_page.dart';
import 'package:provider/provider.dart';
import 'pages/widget/bottom_nav_bar.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'amplify_outputs.dart';
import 'model/ModelProvider.dart';

Future<void> main() async {
  runApp(const MyApp());
  try {
    final api = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    await Amplify.addPlugins([api]);
    await Amplify.configure(amplifyConfig);

    safePrint('Successfully configured Amplify');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentPageIndex = 0;

  void changePage(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page = Placeholder();
    switch (_currentPageIndex) {
      case 0:
        page = HomePage();
      case 1:
        page = RankingPage();
      case 2:
        page = ReccPage();
      case 3:
        page = ProfilePage();
      default:
        page = HomePage();
    }

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PostModel())],
      child: MaterialApp(
        home: Scaffold(
          body: page,
          bottomNavigationBar: BottomNavBar(changePage),
          floatingActionButton: AddPostButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
