import 'package:dictionary_flutter/definition_results/definition_results_viewmodel.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/search_bar/searchbar_viewmodel.dart';
import 'package:dictionary_flutter/service_locator.dart';
import 'package:flutter/foundation.dart';

class DefinitionLookupViewModel extends ChangeNotifier {
  final DictionaryRepository _dictionaryRepository =
      serviceLocator<DictionaryRepository>();

  late SearchBarViewModel searchBarViewModel;
  late DefinitionResultsViewModel definitionResultsViewModel;

  DefinitionLookupViewModel() {
    searchBarViewModel = SearchBarViewModel();
    definitionResultsViewModel = DefinitionResultsViewModel();

    _listenToSearchBar();
  }

  void _listenToSearchBar() {
    searchBarViewModel
        .addListener(() => {_getDefinitions(searchBarViewModel.searchTerm)});
  }

  Future _getDefinitions(String word) async {
    definitionResultsViewModel.clear();
    var defs = await _dictionaryRepository.findDefinitions(word);
    definitionResultsViewModel.addAll(defs ?? []);
  }
}
