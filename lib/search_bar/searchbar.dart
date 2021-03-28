import 'searchbar_slab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return BlocBuilder<SearchBarSlab, SearchBarState>(
      builder: (context, state) {
        return Container(
          child: TextField(
            controller: _controller,
            onChanged: (text) =>
                context.read<SearchBarSlab>().add(SearchBarChangeText(text)),
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  context.read<SearchBarSlab>().add(SearchBarClearText());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
