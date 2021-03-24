import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_actions.dart';
import 'package:redux/redux.dart';
import 'dart:developer' as developer;

class SearchBarViewModel {
  final String searchTerm;
  final Function(String) onNewSearchTerm;
  final Function onClearPressed;

  SearchBarViewModel(
      this.searchTerm, this.onNewSearchTerm, this.onClearPressed);

  factory SearchBarViewModel.create(Store<AppState> store) {
    return SearchBarViewModel(store.state.definitionsState.word, (searchTerm) {
      developer.log("fetching defs from vm");
      store.dispatch(fetchDefinitionsAction(searchTerm));
    }, () {
      developer.log("resetting to initial state");
      store.dispatch(SetDefinitionsStateAction(DefinitionsState.initial()));
    });
  }
}
