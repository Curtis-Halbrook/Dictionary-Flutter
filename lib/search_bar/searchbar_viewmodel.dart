import 'package:dictionary_flutter/redux/definitions/definitions_actions.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:redux/redux.dart';

class SearchBarViewModel {
  final String searchTerm;
  final Function(String) onNewSearchTerm;
  final Function onClearPressed;

  SearchBarViewModel(
    this.searchTerm,
    this.onNewSearchTerm,
    this.onClearPressed,
  );

  factory SearchBarViewModel.create(Store<AppState> store) {
    return SearchBarViewModel(
      store.state.definitionsState.word,
      (searchTerm) {
        store.dispatch(fetchDefinitionsAction(searchTerm));
      },
      () {
        store.dispatch(SetDefinitionsStateAction(DefinitionsState.initial()));
      },
    );
  }
}
