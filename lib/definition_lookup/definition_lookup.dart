import 'package:dictionary_flutter/definition_lookup/definition_lookup_store.dart';
import 'package:dictionary_flutter/definition_results/definition_results.dart';
import 'package:dictionary_flutter/definition_results/definition_results_store.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefinitionLookup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DefinitionLookupStore>(context);
    return Column(
      children: [
        SearchBar(store.searchBarStore),
        Expanded(
          child: DefinitionResults(store.definitionResultsStore),
        ),
      ],
    );
  }
}
