import 'package:test/test.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/static_dictionary_service.dart';

void main() async {
  group('Test the Static Dictionary Service', () {
    test('Test basic functionality', () async {
      final staticSvc = StaticDictionaryService();
      final results = await staticSvc.findDefinitions("chair");
      expect(results, isNot(null));
      expect(results!.length, 2);
      expect(results[0].definition, 'Flat-topped butt-resting thing');
      expect(results[0].partOfSpeech, 'noun');
    });
  });
}
