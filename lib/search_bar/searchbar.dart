import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _controller,
        onChanged: (value) => {'[Some means of updating state]'},
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              '[Some Means of Updating State]';
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
