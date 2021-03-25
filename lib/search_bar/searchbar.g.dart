// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchbar.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchBarStore on _SearchBarStore, Store {
  final _$textAtom = Atom(name: '_SearchBarStore.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$_SearchBarStoreActionController =
      ActionController(name: '_SearchBarStore');

  @override
  void changeText(String newText) {
    final _$actionInfo = _$_SearchBarStoreActionController.startAction(
        name: '_SearchBarStore.changeText');
    try {
      return super.changeText(newText);
    } finally {
      _$_SearchBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearText() {
    final _$actionInfo = _$_SearchBarStoreActionController.startAction(
        name: '_SearchBarStore.clearText');
    try {
      return super.clearText();
    } finally {
      _$_SearchBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text}
    ''';
  }
}
