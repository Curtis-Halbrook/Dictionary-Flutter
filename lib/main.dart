import 'package:dictionary_flutter/redux/store.dart';
import 'package:dictionary_flutter/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_flutter/definition_lookup/definition_lookup.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async {
  await Redux.init();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Find Definitions',
        home: StoreProvider<AppState>(
          store: Redux.store,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Find Definitions'),
            ),
            body: Container(
              child: DefinitionLookup(),
            ),
          ),
        ));
  }
}
