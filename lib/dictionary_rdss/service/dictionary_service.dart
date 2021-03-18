import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';

abstract class DictionaryService {
  Future<List<Definition>?> findDefinitions(String word);
}
