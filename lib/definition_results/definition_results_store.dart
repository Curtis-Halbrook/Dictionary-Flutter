import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:mobx/mobx.dart';

part 'definition_results_store.g.dart';

class DefinitionResultsStore = _DefinitionResultsStore
    with _$DefinitionResultsStore;

abstract class _DefinitionResultsStore with Store {
  @observable
  List<Definition> definitions = [];

  @action
  void updateDefinitions(List<Definition> newDefinitions) {
    definitions = newDefinitions;
  }
}
