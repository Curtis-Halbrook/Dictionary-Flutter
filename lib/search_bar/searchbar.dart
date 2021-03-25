import 'package:dictionary_flutter/search_bar/searchbar_store.dart';
import 'package:flutter/material.dart';

//Here, the store is "injected" into the widget by a parent as opposed to the
//use of "Provider" published into the widget tree.
class SearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final SearchBarStore store;

  SearchBar(this.store);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (newText) => store.changeText(newText),
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            store.clearText();
            _controller.clear();
          },
        ),
      ),
    );
  }
}
