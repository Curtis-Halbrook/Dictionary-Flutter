import 'package:dictionary_flutter/definition_results/definition_results_viewmodel.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
// import 'package:dictionary_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DefinitionResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DefinitionResultsViewModel model =
        Provider.of<DefinitionResultsViewModel>(context);

    return ListView.builder(
      itemCount: model.definitions.length,
      padding: EdgeInsets.symmetric(vertical: 4.0),
      itemBuilder: (context, index) =>
          // ListTile(
          //   title: Text(model.definitions[index].definition),
          // ),
          DefinitionResultTile(
        model.definitions[index],
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
