import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'searchbar.g.dart';

class SearchBarStore = _SearchBarStore with _$SearchBarStore;

abstract class _SearchBarStore with Store {
  @observable
  String text = '';

  @action
  void changeText(String newText) => text = newText;

  @action
  void clearText() => text = '';
}

//Here, the store is "injected" into the widget by a parent
class SearchBar extends StatelessWidget {
  final SearchBarStore store;

  const SearchBar(this.store);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) => store.changeText(newText),
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            store.clearText();
          },
        ),
      ),
    );
  }
}
