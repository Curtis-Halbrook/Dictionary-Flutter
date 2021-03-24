import 'package:dictionary_flutter/redux/definitions/definitions_actions.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_reducer.dart';
import 'package:dictionary_flutter/redux/definitions/definitions_state.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetDefinitionsStateAction) {
    final nextDefinitionState =
        definitionsReducer(state.definitionsState, action);

    return state.copyWith(nextDefinitionState);
  }
  return state;
}

@immutable
class AppState {
  final DefinitionsState definitionsState;

  AppState(this.definitionsState);

  AppState copyWith(DefinitionsState? definitionsState) {
    return AppState(definitionsState ?? this.definitionsState);
  }
}

class Redux {
  static Store<AppState>? _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store!;
    }
  }

  static Future<void> init() async {
    final definitionsStateInitial = DefinitionsState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(definitionsStateInitial),
    );
  }
}
