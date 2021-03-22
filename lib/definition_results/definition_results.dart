import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';

class DefinitionResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1, //Some means of adding state
      padding: EdgeInsets.symmetric(vertical: 4.0),
      itemBuilder: (context, index) => DefinitionResultTile(
        Definition("Some Means of Adding State", "noun"),
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
