import 'package:test/test.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/wordsapi_dictionary_service.dart';

void main() async {
  group('Test the WordsAPI; normally this should be commented out', () {
    test('Test basic functionality', () async {
      final wordsAPI = WordsApiDictionaryService();
      final results = await wordsAPI.findDefinitions("chair");
      expect(results, isNot(null));
      expect(results!.length, 7);
    });

    test('Test asking for gibberish', () async {
      final wordsAPI = WordsApiDictionaryService();
      final results = await wordsAPI.findDefinitions("ghghg");
      expect(results, null);
    });
  });
}
