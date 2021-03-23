import 'package:dictionary_flutter/definition_results/definition_results.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:flutter/material.dart';

class DefinitionLookup extends StatefulWidget {
  @override
  _DefinitionLookupState createState() => _DefinitionLookupState();
}

class _DefinitionLookupState extends State<DefinitionLookup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchBar(),
          Expanded(
            child: DefinitionResults(),
          ),
        ],
      ),
    );
  }
}
