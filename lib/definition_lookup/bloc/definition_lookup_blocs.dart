import 'dart:async';

import 'package:dictionary_flutter/definition_results/defnition_results_bloc.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
// import 'package:dictionary_flutter/search_bar/searchbar_bloc.dart';
import 'package:dictionary_flutter/search_bar/searchbar_slab.dart';
import 'package:flutter/material.dart';

class DefinitionLookupBlocs {
  final SearchBarSlab searchBarSlab = SearchBarSlab();
  final DefinitionResultsBloc definitionResultsBloc = DefinitionResultsBloc();

  DictionaryRepository _dictionaryRepository;
  late StreamSubscription _searchBarSubscription;

  DefinitionLookupBlocs(this._dictionaryRepository) {
    //Here, we will set up the listeners and behaviors between our two
    //blocs and our Repo to coordinate user activity to network lookups
    //and results

    _searchBarSubscription = searchBarSlab.output.listen(
      (output) async {
        if (output is SearchBarTextChanged) {
          final searchText = output.newText;
          if (searchText.isNotEmpty) {
            final definitions =
                await _dictionaryRepository.findDefinitions(searchText);
            if (definitions != null) {
              definitionResultsBloc.add(DefinitionResultsUpdated(definitions));
            }
          }
        }
      },
    );
  }

  void dispose() {
    _searchBarSubscription.cancel();
  }
}
