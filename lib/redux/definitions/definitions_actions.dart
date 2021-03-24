import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:redux/redux.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../service_locator.dart';
import '../store.dart';
import 'dart:developer' as developer;

class SetDefinitionsStateAction {
  final DefinitionsState definitionsState;

  SetDefinitionsStateAction(this.definitionsState);
}

final DictionaryRepository _dictionaryRepository =
    serviceLocator<DictionaryRepository>();

ThunkAction<AppState> fetchDefinitionsAction(String word) {
  developer.log("fetching defs from redux action 1 for $word");

  return (Store<AppState> store) async {
    developer.log("fetching defs from redux action 2 for $word");
    store
        .dispatch(SetDefinitionsStateAction(DefinitionsState(isLoading: true)));
    try {
      developer.log("calling repo");
      var repo = serviceLocator<DictionaryRepository>();
      var definitions = await repo.findDefinitions(word);
      developer.log("got $definitions");
      store.dispatch(SetDefinitionsStateAction(DefinitionsState(
          isError: false, isLoading: false, definitions: definitions ?? [])));
    } catch (error) {
      store
          .dispatch(SetDefinitionsStateAction(DefinitionsState(isError: true)));
    }
  };
}
