import 'package:dictionary_flutter/definition_results/definition_results.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:mvu_layer/mvu_layer.dart';
import 'package:flutter/material.dart';

class DefinitionLookupModel {
  late final searchBarModel = SearchBarModel('');
  late final definitionResultsModel = DefinitionResultsModel([]);
}

class DefinitionLookupMessenger extends Messenger<DefinitionLookupModel> {
  late DictionaryRepository _dictionaryRepository;
  late SearchBarMessenger searchBarMessenger;
  late DefinitionResultsMessenger definitionResultsMessenger;

  DefinitionLookupMessenger(this._dictionaryRepository)
      : super.model(DefinitionLookupModel()) {
    searchBarMessenger = SearchBarMessenger();
    definitionResultsMessenger = DefinitionResultsMessenger();
  }
}

class DefinitionLookupWidget {
  static Widget builder(
    BuildContext context,
    DefinitionLookupMessenger messenger,
    DefinitionLookupModel model,
  ) =>
      Container(
        child: Column(
          children: [
            SearchBarWidget.builder(
              context,
              messenger.searchBarMessenger,
              model.searchBarModel,
            ),
            Expanded(
              child: DefinitionResultsWidget.builder(
                context,
                messenger.definitionResultsMessenger,
                model.definitionResultsModel,
              ),
            ),
          ],
        ),
      );
}
