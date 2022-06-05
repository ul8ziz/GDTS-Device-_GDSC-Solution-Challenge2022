import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/model/user_model/users_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void registerUser({
    @required String name,
    @required String phone,
    @required String email,
    @required String password,
  }) {
    emit(RegisterLoading());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate( email: email,name: name, phone: phone, uId:value.user.uid );
      print(value.user.email);
      print(value.user.uid);
      print('no');
    }).catchError((erorr) {
      print('erorr');
      emit(RegisterErorr(erorr.toString()));
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String phone,
    @required String uId,

  }){
    UserModel userModel = UserModel(
      email: email,
      name: name,
      phone:phone,
      uId: uId,
      image: 'https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?w=900',
      cover: 'https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?w=900',
      age: 'enter your age',
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap()).then((value){
      print('create');
      emit(UserCreateSuccess());
    });

  }
}
