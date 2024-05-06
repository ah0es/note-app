import 'package:flutter/material.dart';

class SearchExample extends StatefulWidget {
  const SearchExample({super.key});

  @override
  _SearchExampleState createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  List<String> allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
  ];
  List<String> displayedItems = [];

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedItems.addAll(allItems);
  }

  void filterItems(String query) {
    query = query.toLowerCase();
    setState(() {
      displayedItems =
          allItems.where((item) => item.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(         
        title: isSearching
            ? TextField(
                controller: searchController,
                onChanged: (query) => filterItems(query),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              )
            : const Text('Items'),
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.cancel : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  displayedItems = allItems;
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: displayedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(displayedItems[index]),
          );
        },
      ),
    );
  }
}

