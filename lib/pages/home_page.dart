import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tastebuds/model/user_model.dart';
import 'package:tastebuds/pages/search_page.dart';
import './widget/post_grid.dart';
import 'package:tastebuds/model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  bool searching = false;
  TextEditingController searchController = TextEditingController();
  String search = "";
  @override
  void initState() {
    super.initState();
    context.read<UserModel>().userLogin();
  }

  void onSearchSave() {
    setState(() {
      search = searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.surface
              : Theme.of(context).colorScheme.secondary,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute( builder: (context) => SearchPage()));
                }),
          ],
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 50,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 0;
                    });
                  },
                  child: Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          (page == 0) ? FontWeight.w700 : FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 1;
                    });
                  },
                  child: Text(
                    "Following",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          (page == 1) ? FontWeight.bold : FontWeight.normal,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ],
          ),
        ),
        body: Center(
          child: 
            <Widget>[
              PostGrid(posts: context.watch<PostModel>().getPostList(20)),
              PostGrid(posts: context.watch<PostModel>().getPostList(20)),
            ][page]
          ),
        );
  }
}
