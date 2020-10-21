abstract class CounterState {}

class CounterUninitialized extends CounterState {}

class CounterLoaded extends CounterState {
  int counter;
  CounterLoaded({this.counter});

  CounterLoaded copyWith({int counter}) {
    return CounterLoaded(
      counter: counter
    );
  }
}