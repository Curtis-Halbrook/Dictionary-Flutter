import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dictionary_flutter/slab/slab.dart';

//
//Events
@immutable
abstract class SearchBarEvent {}

class SearchBarChangeText extends SearchBarEvent {
  final String newText;
  SearchBarChangeText(this.newText);
}

class SearchBarClearText extends SearchBarEvent {}

//
//State
//Could have just been a String, but I want to test class behavior here
class SearchBarState {
  final String text;

  SearchBarState(this.text);
}

//
//Output
abstract class SearchBarOutput {}

class SearchBarTextChanged extends SearchBarOutput {
  final String newText;
  SearchBarTextChanged(this.newText);
}

//
//The Slab!
class SearchBarSlab
    extends Slab<SearchBarEvent, SearchBarState, SearchBarOutput> {
  SearchBarSlab() : super(SearchBarState(''));

  @override
  Stream<Transition<SearchBarEvent, SearchBarState>> transformEvents(
    Stream<SearchBarEvent> events,
    Stream<Transition<SearchBarEvent, SearchBarState>> Function(
      SearchBarEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<SearchBarState> mapEventToState(SearchBarEvent event) async* {
    if (event is SearchBarChangeText) {
      final String text = event.newText;
      yield SearchBarState(text);
    }
    if (event is SearchBarClearText) {
      yield SearchBarState('');
    }
  }

  @override
  Stream<SearchBarOutput> mapEventToOutput(SearchBarEvent event) async* {
    if (event is SearchBarChangeText) {
      final String text = event.newText;
      yield SearchBarTextChanged(text);
    }
    if (event is SearchBarClearText) {
      yield SearchBarTextChanged('');
    }
  }
}
