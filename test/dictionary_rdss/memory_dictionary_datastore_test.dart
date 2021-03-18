import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:test/test.dart';
import 'package:dictionary_flutter/dictionary_rdss/data_store/memory_dictionary_datastore.dart';

void main() {
  group('Test the Memory-based DictionaryDataStore instance', () {
    test('Confirm we dont find one', () async {
      var memDS = MemoryDictionaryDataStore();
      var defs = await memDS.getDefinitions('word');
      expect(defs, null);
    });

    test('Add a definition', () async {
      var definition = Definition('definition', 'partOfSpeech');
      var word = 'word';

      var memDS = MemoryDictionaryDataStore();
      await memDS.saveDefinitions([definition], word);
      var defs = await memDS.getDefinitions(word);
      expect(defs, isNot(null));
      expect(defs!.length, 1);
      expect(defs[0].definition, definition.definition);
      expect(defs[0].partOfSpeech, definition.partOfSpeech);
    });
  });
}
