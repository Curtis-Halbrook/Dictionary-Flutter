import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';

class DefinitionResultsViewModel with ChangeNotifier {
  final List<Definition> _definitions = [];

  List<Definition> get definitions => _definitions;

  void clear() {
    _definitions.clear();
    notifyListeners();
  }

  void addAll(List<Definition> definitions) {
    _definitions.addAll(definitions);
    notifyListeners();
  }
}
