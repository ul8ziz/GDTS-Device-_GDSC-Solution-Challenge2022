import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      emit(LoginSuccess(value.user.uid));
    }).catchError((erorr) {
      print(erorr.toString());
      emit(LoginErorr(erorr.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isShowPass = false;
  void changPasswordVisibility() {
    isShowPass = !isShowPass;

    suffix =
    isShowPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LogShowPassword());
  }
}
