part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String uId;

  LoginSuccess(this.uId);
}

class LoginErorr extends LoginState {
  final String erorr;

  LoginErorr(this.erorr);
}

class LogShowPassword extends LoginState {}
