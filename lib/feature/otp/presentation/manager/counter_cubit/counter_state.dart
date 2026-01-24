part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}
final class CounterDecrease extends CounterState {
  final int time;
  const CounterDecrease(this.time);

  @override
  List<Object> get props => [time];
}
