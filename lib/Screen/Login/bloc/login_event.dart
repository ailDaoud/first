part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class StartLogin extends LoginEvent {
  final String name;
  final String email;
  final String password;
  final String password_confrmation;

  const StartLogin({required this.name, required this.email, required this.password, required this.password_confrmation});
}

class StartVerify extends LoginEvent {
  final String email;
  final String otp;

 const StartVerify({required this.otp,required this.email});
}
