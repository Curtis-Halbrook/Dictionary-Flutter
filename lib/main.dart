import 'package:flutter/material.dart';
import 'package:dictionary_flutter/definition_lookup/definition_lookup.dart';

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
        body: Container(
          child: DefinitionLookup(),
        ),
      ),
    );
  }
}
