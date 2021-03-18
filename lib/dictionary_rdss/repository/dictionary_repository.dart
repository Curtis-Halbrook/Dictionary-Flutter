import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';

abstract class DictionaryRepository {
  Future<List<Definition>?> findDefinitions(String word);
}
