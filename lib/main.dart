// @dart=2.9
import 'package:dictionary_flutter/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/wordsapi_dictionary_service.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_flutter/definition_lookup/definition_lookup.dart';
import 'package:mvu_layer/mvu_layer.dart';

import 'dictionary_rdss/repository/dictionary_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DictionaryRepository _dictRepo = BasicDictionaryRepository(
      MemoryDictionaryDataStore(),
      WordsApiDictionaryService(),
    );

    return MaterialApp(
      title: 'Find Definitions',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find Definitions'),
        ),
        body: MsgBuilder<DefinitionLookupMessenger, DefinitionLookupModel>(
          messenger: DefinitionLookupMessenger(_dictRepo),
          builder: DefinitionLookupWidget.builder,
        ),
      ),
    );
  }
}
