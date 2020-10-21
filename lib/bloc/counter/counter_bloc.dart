import 'dart:async';

import 'package:bbd_client/bloc/counter/counter_event.dart';
import 'package:bbd_client/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterUninitialized());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if(state is CounterUninitialized) {
      yield CounterLoaded(counter: 1);
    } else {
      CounterLoaded counterLoad = state as CounterLoaded;
      final int result = counterLoad.counter;
      if (event is IncrementEvent) {
        IncrementEvent incrementEvent = event as IncrementEvent;
        int data = result + incrementEvent.counter;
        yield CounterLoaded(counter: data);
      } else if(event is DecrementEvent) {
        DecrementEvent decrementEvent = event as DecrementEvent;
        int data = result - decrementEvent.counter;
        yield CounterLoaded(counter: data);
      }
    }
  }
}