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
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextFormField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        border: InputBorder.none,
                      ),
                      onEditingComplete: onSearchSave,
                      onTap: () {
                        searching = true;
                      },
                      onTapOutside: (e) {
                        searching = false;
                      },
                    ))
                  ]))),
          PostGrid(
              posts: searching
                  ? context.watch<PostModel>().getPostListContaining(search)
                  : Future.value([]))
        ],
      ),
    );
  }
}
