import 'package:dictionary_flutter/definition_results/definition_results_viewmodel.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DefinitionResultsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DefinitionResultViewModel>(
      converter: (Store<AppState> store) =>
          DefinitionResultViewModel.create(store),
      builder: (context, viewModel) {
        return DefinitionResults(viewModel);
      },
    );
  }
}

class DefinitionResults extends StatelessWidget {
  final DefinitionResultViewModel viewModel;

  DefinitionResults(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.definitions.length, //Some means of adding state
      padding: EdgeInsets.symmetric(vertical: 4.0),
      itemBuilder: (context, index) => DefinitionResultTile(
        viewModel.definitions[index],
      ),
    );
  }
}

class DefinitionResultTile extends StatelessWidget {
  final Definition definition;

  DefinitionResultTile(this.definition);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        isThreeLine: true,
        title: Text(definition.definition),
        subtitle: Text(definition.partOfSpeech),
      ),
    );
  }
}
