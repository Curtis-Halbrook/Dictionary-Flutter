import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_flutter/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DefinitionResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _DefinitionResultsContainer(),
    );
  }
}

class _DefinitionResultsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _DefinitionResultViewModel>(
      converter: (Store<AppState> store) =>
          _DefinitionResultViewModel.create(store),
      builder: (context, viewModel) {
        return _DefinitionResultsView(viewModel);
      },
    );
  }
}

class _DefinitionResultsView extends StatelessWidget {
  final _DefinitionResultViewModel viewModel;

  _DefinitionResultsView(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.definitions.length, //Some means of adding state
      padding: EdgeInsets.symmetric(vertical: 4.0),
      itemBuilder: (context, index) => _DefinitionResultTile(
        viewModel.definitions[index],
      ),
    );
  }
}

class _DefinitionResultTile extends StatelessWidget {
  final Definition definition;

  _DefinitionResultTile(this.definition);

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

class _DefinitionResultViewModel {
  final List<Definition> definitions;

  _DefinitionResultViewModel(this.definitions);

  factory _DefinitionResultViewModel.create(Store<AppState> store) =>
      _DefinitionResultViewModel(store.state.definitionsState.definitions);
}
