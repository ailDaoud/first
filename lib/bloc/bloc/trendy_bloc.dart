import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task2/Model/trendymodel.dart';
import 'package:first_task2/Repository/contentrepo.dart';
import 'package:flutter/material.dart';

part 'trendy_event.dart';
part 'trendy_state.dart';

class TrendyBloc extends Bloc<TrendyEvent, TrendyState> {
  TrendyBloc() : super(TrendyInitial()) {
    on<Starttrendy>(gettrendy);
  }
  FutureOr<void> gettrendy(Starttrendy event, Emitter<TrendyState> emit) async {
    List<Datum> trendy = [];
    try {
      trendy = await ContantRep().fetchtrendypro();
      if (trendy.isEmpty) {
        emit(LoadingTrendy());
      } else {
        print(trendy.length);
        print("++++++++++++++++++++++++pppppppp++++++++++++++");
        emit(GetTrendySucsess(trendy: trendy));
      }
    } catch (e) {
      emit(GetTrendyFailed(error: "message"));
    }
  }
}
