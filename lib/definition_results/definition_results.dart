import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:mvu_layer/mvu_layer.dart' as Mvu;

class Model {
  final List<Definition> definitions;

  Model(this.definitions);
}

class Messenger extends Mvu.Messenger<Model> {
  Messenger(definitions) : super(Mvu.Update(Model(definitions)));

  void changeDefinitions(List<Definition> definitions) => modelDispatcher(
        (model) => Model(definitions),
      );
}

class DefinitionResultsWidget {
  static Widget builder(
    BuildContext context,
    Messenger messenger,
    Model model,
  ) =>
      ListView.builder(
        itemCount: model.definitions.length,
        padding: EdgeInsets.symmetric(vertical: 4.0),
        itemBuilder: (context, index) => _DefinitionResultTile(
          model.definitions[index],
        ),
      );
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
