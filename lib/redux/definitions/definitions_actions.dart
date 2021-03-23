import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:redux/redux.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../service_locator.dart';
import '../store.dart';

class SetDefinitionsStateAction {
  final DefinitionsState definitionsState;

  SetDefinitionsStateAction(this.definitionsState);
}

final DictionaryRepository _dictionaryRepository = serviceLocator<DictionaryRepository>();

Future<ThunkAction<AppState>> fetchDefinitionsAction(String word) async {
  return (Store<AppState> store) async {
    store.dispatch(SetDefinitionsStateAction(DefinitionsState(isLoading: true)));

    try {
      var definitions = await _dictionaryRepository.findDefinitions(word);
      store.dispatch(SetDefinitionsStateAction(DefinitionsState(
          isError: false,
          isLoading: false,
          definitions: definitions ?? []
      )));
    } catch (error) {
      store.dispatch(SetDefinitionsStateAction(DefinitionsState(isError: true)));
    }
  };
}