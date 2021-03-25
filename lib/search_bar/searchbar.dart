import 'package:dictionary_flutter/redux/store.dart';
import 'package:dictionary_flutter/search_bar/searchbar_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SearchBarContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SearchBarViewModel>(
      converter: (Store<AppState> store) => SearchBarViewModel.create(store),
      builder: (context, viewModel) {
          return SearchBar(viewModel);
      },
    );
  }
}

class SearchBar extends StatefulWidget {
  final SearchBarViewModel viewModel;

  SearchBar(this.viewModel);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    print("building _SearchBarState");
    return Container(
              child: TextField(
                controller: _controller,
                onChanged: widget.viewModel.onNewSearchTerm,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      widget.viewModel.onClearPressed.call();
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
