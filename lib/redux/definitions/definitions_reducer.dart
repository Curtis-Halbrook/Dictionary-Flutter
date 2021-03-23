import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'definitions_actions.dart';

definitionsReducer(DefinitionsState prevState, SetDefinitionsStateAction action) {
  final payload = action.definitionsState;

  return prevState.copyWith(
      word: payload.word,
      isError: payload.isError,
      isLoading: payload.isLoading,
      definitions: payload.definitions);
}
