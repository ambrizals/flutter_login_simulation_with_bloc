abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  int counter;
  IncrementEvent(this.counter);

  IncrementEvent copyWith({int counter}) {
    return IncrementEvent(
        counter
    );
  }
}

class DecrementEvent extends CounterEvent {
  int counter;
  DecrementEvent(this.counter);

  DecrementEvent copyWith({int counter}) {
    return DecrementEvent(
        counter
    );
  }
}