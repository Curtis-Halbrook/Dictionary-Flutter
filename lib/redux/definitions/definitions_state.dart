import 'package:dictionary_flutter/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/foundation.dart';


@immutable
class DefinitionsState {
  final String word;
  final bool isError;
  final bool isLoading;
  final List<Definition> definitions;

  DefinitionsState({
    this.word = "",
    this.isError = false,
    this.isLoading = false,
    this.definitions = const []});

  factory DefinitionsState.initial() => DefinitionsState();

  DefinitionsState copyWith({
      String? word,
      bool? isError,
      bool? isLoading,
      List<Definition>? definitions}) {
    return DefinitionsState(
        word: word ?? this.word,
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading,
        definitions: definitions ?? this.definitions);
  }
}
