import 'package:dictionary_flutter/definition_lookup/definition_lookup_viewmodel.dart';
import 'package:dictionary_flutter/definition_results/definition_results.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefinitionLookup extends StatefulWidget {
  static String routeName = '/';

  @override
  _DefinitionLookupState createState() => _DefinitionLookupState();
}

class _DefinitionLookupState extends State<DefinitionLookup> {
  @override
  Widget build(BuildContext context) {
    final DefinitionLookupViewModel model =
        Provider.of<DefinitionLookupViewModel>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => model.searchBarViewModel),
        ChangeNotifierProvider(create: (_) => model.definitionResultsViewModel),
      ],
      child: Container(
        child: Column(
          children: [
            SearchBar(),
            Expanded(
              child: DefinitionResults(),
            ),
          ],
        ),
      ),
    );
  }
}
