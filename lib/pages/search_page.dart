import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widget/post_grid.dart';
import 'package:tastebuds/model/post_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool searching = false;
  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  void initState() {
    super.initState();
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
        title: Text("Search"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: TextFormField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
              ),
              onEditingComplete: onSearchSave,
              onTap: (){ searching = true;},
              onTapOutside: (e){ searching = false;},
            )),
            PostGrid( posts: searching
                      ? context.watch<PostModel>().getPostListContaining(search)
                      : Future.value([]))
        ],
      ),
    );
}
}