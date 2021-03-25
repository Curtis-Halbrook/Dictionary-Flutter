// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DefinitionResultsStore on _DefinitionResultsStore, Store {
  final _$definitionsAtom = Atom(name: '_DefinitionResultsStore.definitions');

  @override
  List<Definition> get definitions {
    _$definitionsAtom.reportRead();
    return super.definitions;
  }

  @override
  set definitions(List<Definition> value) {
    _$definitionsAtom.reportWrite(value, super.definitions, () {
      super.definitions = value;
    });
  }

  final _$_DefinitionResultsStoreActionController =
      ActionController(name: '_DefinitionResultsStore');

  @override
  void updateDefinitions(List<Definition> newDefinitions) {
    final _$actionInfo = _$_DefinitionResultsStoreActionController.startAction(
        name: '_DefinitionResultsStore.updateDefinitions');
    try {
      return super.updateDefinitions(newDefinitions);
    } finally {
      _$_DefinitionResultsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
definitions: ${definitions}
    ''';
  }
}
