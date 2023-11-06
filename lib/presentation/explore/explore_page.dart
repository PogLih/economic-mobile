import 'package:flutter/material.dart';

import '../../widget/topic/topic.dart';
import '../homePage/home_page.dart';

class ExplorePage extends StatefulWidget {
  static const String routeName = '/dashboard';
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Topic(
                title: 'Top anime',
                moreScreen: HomePage(),
                key: null,
              ),
              Topic(
                title: 'Top anime',
                moreScreen: HomePage(),
                key: null,
              ),
              Topic(
                title: 'Top anime',
                moreScreen: HomePage(),
                key: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> tempData = ['1', '2', '3'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Kết quả tìm kiếm cho: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in tempData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
