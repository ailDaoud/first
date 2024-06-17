part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class SucsessLogin extends LoginState {}

class FailerLogin extends LoginState {
  final String message;

  const FailerLogin({required this.message});
}

class SucsessVarify extends LoginState {}

class FailerVarify extends LoginState {
  final String message;

  const FailerVarify({required this.message});
}
