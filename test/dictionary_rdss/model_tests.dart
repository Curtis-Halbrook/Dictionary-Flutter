import 'dart:convert';

import 'package:test/test.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/wordsapi_model.dart';

void main() {
  group('Dictionary RDSS Model Tests', () {
    test('Parse WordsAPI Result', () {
      final jsonString = '''
      {
        "word": "w", 
        "definitions": [
          {
            "definition": "def", 
            "partOfSpeech": "pos"
          }
        ]
      }
      ''';
      final json = jsonDecode(jsonString);
      var wordsAPI = WordsAPIResult.fromJson(json);
      expect(wordsAPI.word, "w");
      expect(wordsAPI.definitions.length, 1);
      expect(wordsAPI.definitions[0].definition, 'def');
      expect(wordsAPI.definitions[0].partOfSpeech, 'pos');
    });
  });
}
