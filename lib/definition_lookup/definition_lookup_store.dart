import 'package:dictionary_flutter/definition_results/definition_results_store.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/search_bar/searchbar_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'definition_lookup_store.g.dart';

class DefinitionLookupStore = _DefinitionLookupStore
    with _$DefinitionLookupStore;

abstract class _DefinitionLookupStore with Store {
  late final DictionaryRepository _dictionaryRepository;
  late final SearchBarStore searchBarStore;
  late final DefinitionResultsStore definitionResultsStore;

  //This should be disposed when this class goes out of scope!
  late final ReactionDisposer _searchBarChangedDisposer;

  _DefinitionLookupStore(this._dictionaryRepository) {
    definitionResultsStore = DefinitionResultsStore();
    searchBarStore = SearchBarStore();
    _searchBarChangedDisposer = reaction<String>(
      (_) => searchBarStore.text,
      (text) async {
        try {
          final defs = await _dictionaryRepository.findDefinitions(text);
          definitionResultsStore.updateDefinitions(defs ?? []);
        } catch (Exception) {
          print('Ok, an error happened and we'
              'are silently eating it with a print. :(');
        }
      },
    );
  }
}
