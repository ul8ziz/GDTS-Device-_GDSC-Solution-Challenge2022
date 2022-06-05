part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterErorr extends RegisterState {
  final String registerErorr;

  RegisterErorr(this.registerErorr);
}
class UserCreateSuccess extends RegisterState {}

class UserCreateErorr extends RegisterState {
  final String usercreateerorr;

  UserCreateErorr(this.usercreateerorr);
}
