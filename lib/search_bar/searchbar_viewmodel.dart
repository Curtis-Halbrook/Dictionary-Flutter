import 'package:flutter/foundation.dart';

class SearchBarViewModel with ChangeNotifier {
  String _searchTerm = '';

  String get searchTerm => _searchTerm;

  set searchTerm(String term) {
    _searchTerm = term;
    notifyListeners();
  }
}
