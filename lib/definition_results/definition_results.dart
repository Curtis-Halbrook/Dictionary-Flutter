import 'package:dictionary_flutter/definition_results/definition_results_store.dart';
import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DefinitionResults extends StatelessWidget {
  late final DefinitionResultsStore store;

  DefinitionResults(this.store);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.definitions.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Results',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          );
        }

        return ListView.builder(
          itemCount: store.definitions.length,
          padding: EdgeInsets.symmetric(vertical: 4.0),
          itemBuilder: (context, index) => DefinitionResultTile(
            store.definitions[index],
          ),
        );
      },
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
