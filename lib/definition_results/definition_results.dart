import 'package:dictionary_flutter/definition_results/definition_results_store.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

//Unlike the SearchBar, instead of injecting the store, we will use Provider
//to find it in the Widget Tree, placed in by the parent widget
class DefinitionResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DefinitionResultsStore store = Provider.of<DefinitionResultsStore>(context);

    return Observer(
      builder: (_) => ListView.builder(
        itemCount: store.definitions.length,
        padding: EdgeInsets.symmetric(vertical: 4.0),
        itemBuilder: (context, index) => DefinitionResultTile(
          store.definitions[index],
        ),
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
