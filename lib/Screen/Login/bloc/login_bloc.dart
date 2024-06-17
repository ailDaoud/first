import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_task2/Repository/Loginrepo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<StartLogin>(fetchotpp);
    on<StartVerify>(sendotp);
  }
  FutureOr<void> fetchotpp(StartLogin event, Emitter<LoginState> emit) async {
    bool sucsses = await Auth.register(event.name, event.email, event.password, event.password_confrmation);
    if (sucsses) {
      emit(SucsessLogin());
    } else {
      emit(FailerLogin(message: sucsses.toString()));
    }
  }
  FutureOr<void> sendotp(StartVerify event, Emitter<LoginState> emit) async {
    bool sucsses = await Auth.setotp(event.otp,event.email);
    if (sucsses) {
      emit(SucsessVarify());
    } else {
      emit(FailerVarify(message: sucsses.toString()));
    }
  }
}
