part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class CounterPlusOne extends CounterEvent {}

class CounterMinusone extends CounterEvent {}
