import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

abstract class Slab<Event, State, Output> extends Bloc<Event, State> {
  Slab(State initialState) : super(initialState) {
    _bindEventsToOutputs();
  }

  /// Must be implemented when a class extends [Slab].
  /// [mapEventToOutput] is called whenever an [event] is [add]ed
  /// and is responsible for converting that [event] into a new [output].
  /// [mapEventToOutput] can `yield` zero, one, or multiple outputs for an event.
  Stream<Output> mapEventToOutput(Event event);

  StreamSubscription<Output>? _transitionOutputSubscription;

  StreamController<Event>? __eventOutputController;
  StreamController<Event> get _eventOutputController {
    return __eventOutputController ??= StreamController<Event>.broadcast();
  }

  StreamController<Output>? __outputController;
  StreamController<Output> get _outputController {
    return __outputController ??= StreamController<Output>.broadcast();
  }

  /// The current Output stream.
  Stream<Output> get output => _outputController.stream;

  /// Notifies the [Slab] of a new [event] which triggers both [mapEventToState]
  /// and [mapEventToOutput]. If [close] has already been called, any subsequent
  ///  calls to [add] will be ignored and will not result in any subsequent
  /// state changes.
  @override
  void add(Event event) {
    if (_eventOutputController.isClosed) return;
    _eventOutputController.add(event);
    super.add(event);
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    await _eventOutputController.close();
    await _transitionOutputSubscription?.cancel();
    return super.close();
  }

  Stream<Output> transformEventsToOutputs(
    Stream<Event> events,
    Stream<Output> Function(Event) mapperFn,
  ) {
    return events.asyncExpand(mapperFn);
  }

  void _bindEventsToOutputs() {
    _transitionOutputSubscription = transformEventsToOutputs(
      _eventOutputController.stream,
      (event) => mapEventToOutput(event),
    ).listen(
      (output) {
        if (_outputController.isClosed) return;
        _outputController.add(output);
      },
      onError: super.onError,
    );
  }
}
