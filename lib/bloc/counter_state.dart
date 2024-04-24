part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChange extends CounterState {
  final int con;

  CounterChange({required this.con});
}
