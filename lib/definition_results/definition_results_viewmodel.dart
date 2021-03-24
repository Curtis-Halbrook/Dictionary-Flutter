import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:redux/redux.dart';

class DefinitionResultViewModel {
  final List<Definition> definitions;

  DefinitionResultViewModel(this.definitions);

  factory DefinitionResultViewModel.create(Store<AppState> store) =>
      DefinitionResultViewModel(store.state.definitionsState.definitions);
}
