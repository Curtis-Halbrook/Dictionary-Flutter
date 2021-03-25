import 'package:mobx/mobx.dart';

part 'searchbar_store.g.dart';

class SearchBarStore = _SearchBarStore with _$SearchBarStore;

abstract class _SearchBarStore with Store {
  @observable
  String text = '';

  @action
  void changeText(String newText) => text = newText;

  @action
  void clearText() => text = '';
}

//THis is what it would look like without codegen

/*
class SearchBarStore {
  late final Observable<String> _text;
  late Action changeText;
  late Action clearText;

  String get text => _text.value;
  set text(String newText) => _text.value = newText;

  SearchBarStore(String initialValue) {
    _text = Observable(initialValue);
    changeText = Action(_changeText);
    clearText = Action(_clearText);
  }

  void _changeText(String newText) {
    _text.value = newText;
  }

  void _clearText() {
    _text.value = '';
  }
}
*/
