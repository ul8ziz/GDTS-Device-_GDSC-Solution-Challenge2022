import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/model/user_model/users_model.dart';
import 'package:gdtsapp/network/constant/constants.dart';
import 'package:gdtsapp/screens/checkups/checkupsscreen.dart';
import 'package:gdtsapp/screens/home/home_screen.dart';
import 'package:gdtsapp/screens/settings/setting_profile.dart';
import 'package:gdtsapp/screens/tips/tips_screen.dart';
import 'package:gdtsapp/screens/howtouse/howtouse_screen.dart';

import 'package:meta/meta.dart';

part 'gdts_state.dart';

class GdtsCubit extends Cubit<GdtsState> {
  GdtsCubit() : super(GdtsInitial());

  static GdtsCubit get(context) => BlocProvider.of(context);
  //variable currentIndex to give an initial value of the NavigationBar
  int currentIndex = 0;
  /*
  List Widget to call the classes
  and use them in the currentIndex variable
  to switch between pages according to the value of currentIndex
  */
  List<Widget> bottomScreen = [
    HomePage(),

   // TipsPage(),
    CheckupsScreen(),
    HowToUseScreen(),
    SettingsProfile(),
  ];
  //Method to control NavigationBar to move between the pages in the list
  void changeBottom(int index) {

      currentIndex = index;
      emit(GdtsChangeButtonNavState());
  }

  // object of uerModel to used in fetch data
  UserModel userModel;
  //function to get All data user of firebase
  void getData() {
    emit(GdtsLoadingStates());
    //Fetching data according to the user's uId from FirebaseFirestore
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //use the user module to retrieve the data from the module file
      userModel = UserModel.fromJson(value.data());
      print(value.data());
      emit(GdtsSuccessStates());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(GdtsErorrStates());
    });
  }

  List<UserModel> users=[];
  //function Chat
  void getAllUsers(){
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
            users.add(UserModel.fromJson(element.data()));
        });
        emit(GdtsUserSuccessStates());
      }).catchError((erorr) {
        emit(GdtsUserErorrStates());
      });
  }
}
