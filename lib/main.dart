import 'package:dictionary_flutter/definition_lookup/definition_lookup_viewmodel.dart';
import 'package:dictionary_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dictionary_flutter/definition_lookup/definition_lookup.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DefinitionLookupViewModel(),
      child: MaterialApp(
        title: 'Find Definitions',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Find Definitions'),
          ),
          body: Container(
            child: DefinitionLookup(),
          ),
        ),
      ),
    );
  }
}
