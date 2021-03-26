import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../service_locator.dart';
import '../store.dart';

class SetDefinitionsStateAction {
  final DefinitionsState definitionsState;

  SetDefinitionsStateAction(this.definitionsState);
}

ThunkAction<AppState> fetchDefinitionsAction(String word) {
  return (Store<AppState> store) async {
    store.dispatch(SetDefinitionsStateAction(DefinitionsState(
      word: word,
      isLoading: true,
    )));
    try {
      var definitions =
          await serviceLocator<DictionaryRepository>().findDefinitions(word);
      store.dispatch(SetDefinitionsStateAction(DefinitionsState(
          word: word,
          isError: false,
          isLoading: false,
          definitions: definitions ?? [])));
    } catch (error) {
      store.dispatch(SetDefinitionsStateAction(
          DefinitionsState(word: word, isError: true)));
    }
  };
}