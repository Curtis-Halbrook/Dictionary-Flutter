import 'package:dictionary_flutter/definition_results/definition_results_store.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/search_bar/searchbar_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'definition_lookup_complex_store.g.dart';

class DefinitionLookupComplexStore = _DefinitionLookupComplexStore
    with _$DefinitionLookupComplexStore;

abstract class _DefinitionLookupComplexStore with Store {
  // Create observables by decorating the declaration like below
  // @observable
  // String text = '';

  // Create computed observables by decorating the declaration like below
  // @computed
  // String get upperCased => text.toUpperCase();

  // Create observable lists by decorating the declaration like below
  // and using the type
  // @observable
  // ObservableList<String> names = ObservableList<String>();

  // Create actions lists by decorating the method like below
  // @action
  // void changeText(String newText) => text = newText;

  // Create actions lists by decorating the method like below
  // @action
  // void clearText() => text = '';
}
