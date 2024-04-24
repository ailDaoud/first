import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int con = 0;
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is CounterPlusOne) {
        con += 1;
        emit(CounterChange(con: con));
      } else {
        con -= 1;
        emit(CounterChange(con: con));
      }
    });
  }
}
