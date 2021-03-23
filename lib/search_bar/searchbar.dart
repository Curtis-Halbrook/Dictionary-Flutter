import 'package:dictionary_flutter/redux/definitions/definitions_actions.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_flutter/redux/store.dart';

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
        onChanged: (value) => {
           Redux.store.dispatch(fetchDefinitionsAction(value))
        },
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              Redux.store.dispatch(SetDefinitionsStateAction(DefinitionsState.initial()));
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
