// @dart=2.9
import 'package:dictionary_flutter/definition_lookup/definition_lookup_store.dart';
import 'package:dictionary_flutter/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/wordsapi_model.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/wordsapi_dictionary_service.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:dictionary_flutter/search_bar/searchbar_store.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_flutter/definition_lookup/definition_lookup.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Definitions',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find Definitions'),
        ),
        body: Provider<DefinitionLookupStore>(
          create: (_) => DefinitionLookupStore(
            BasicDictionaryRepository(
              MemoryDictionaryDataStore(),
              WordsApiDictionaryService(),
            ),
          ),
          child: DefinitionLookup(),
        ),
      ),
    );
  }
}
