import 'package:dictionary_flutter/dictionary_rdss/data_store/dictionary_datastore.dart';
import 'package:dictionary_flutter/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/dictionary_service.dart';
import 'package:dictionary_flutter/dictionary_rdss/service/wordsapi_dictionary_service.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //DictionaryRDSS
  serviceLocator
    ..registerLazySingleton<DictionaryDataStore>(
      () => MemoryDictionaryDataStore(),
    )
    ..registerFactory<DictionaryService>(
      () => WordsApiDictionaryService(),
    )
    ..registerFactory<DictionaryRepository>(
      () => BasicDictionaryRepository(
        serviceLocator<DictionaryDataStore>(),
        serviceLocator<DictionaryService>(),
      ),
    );
}
