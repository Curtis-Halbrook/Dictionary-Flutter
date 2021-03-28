import 'package:dictionary_flutter/definition_lookup/bloc/definition_lookup_blocs.dart';
import 'package:dictionary_flutter/definition_results/definition_results.dart';
import 'package:dictionary_flutter/definition_results/defnition_results_bloc.dart';
import 'package:dictionary_flutter/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_flutter/search_bar/searchbar.dart';
import 'package:dictionary_flutter/search_bar/searchbar_slab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DefinitionLookup extends StatefulWidget {
  @override
  _DefinitionLookupState createState() => _DefinitionLookupState();
}

class _DefinitionLookupState extends State<DefinitionLookup> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          DefinitionLookupBlocs(context.read<BasicDictionaryRepository>()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchBarSlab>(
              create: (context) =>
                  context.read<DefinitionLookupBlocs>().searchBarSlab),
          BlocProvider<DefinitionResultsBloc>(
              create: (context) =>
                  context.read<DefinitionLookupBlocs>().definitionResultsBloc),
        ],
        child: Container(
          child: Column(
            children: [
              SearchBar(),
              const Padding(padding: EdgeInsets.all(12)),
              Expanded(
                child: DefinitionResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
