import 'package:dictionary_flutter/search_bar/searchbar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    SearchBarViewModel model = Provider.of<SearchBarViewModel>(context);

    return Container(
      child: TextField(
        controller: _controller,
        onChanged: (value) => model.searchTerm = value,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              model.searchTerm = '';
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    final model = Provider.of<SearchBarViewModel>(context, listen: false);
    super.initState();
    _controller = TextEditingController(text: model.searchTerm);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
