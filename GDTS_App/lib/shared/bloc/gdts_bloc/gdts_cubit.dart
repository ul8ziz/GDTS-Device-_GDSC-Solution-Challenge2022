
import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../screens/howtouse/howtouse_screen.dart';

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

  //package of fetching image from phone
  File Profileimage;

  var picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Profileimage = File(pickedFile.path);
     print(Profileimage.path);
      emit(GdtsProfileImageSuccessState());
    } else {
      print('No image selected !');
      emit(GdtsProfileImageErorrState());
    }
  }

  File coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(GdtsCoverImageSuccessState());
    } else {
      print('No image selected !');
      emit(GdtsCoverImageErorrState());
    }
  }
  void uploadProfileImage({
    @required String name,
    @required String phone,
    @required String age,
  }) {
    emit(GdtsUpdateLoadingStates());
    //code to upload images to firebase Storage
    // after fetching them from the gallery from the function getImage
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(Profileimage.path).pathSegments.last}')
        .putFile(Profileimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        updateUser(name: name, phone: phone, age: age, image: value);
        emit( GdtsUploadProfileImageSuccessState());
      }).catchError((erorr) {
        emit(GdtsUploadProfileImageErorrState());
      });
    }).catchError((erorr) {
      emit(GdtsUploadProfileImageErorrState());
    });
  }

  void uploadCoverImage({
    @required String name,
    @required String phone,
    @required String age,
  }) {
    emit(GdtsUpdateLoadingStates());
    //code to upload images to firebase Storage
    // after fetching them from the gallery from the function getCoverImage
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        // emit(NotaatUploadProfileImageSuccessState());
        updateUser(name: name, phone: phone, age: age, cover: value);
      }).catchError((erorr) {
        emit( GdtsUploadCoverImageErorrState());
      });
    }).catchError((erorr) {
      emit( GdtsUploadCoverImageErorrState());
    });
  }

  void updateUser({
    @required String name,
    @required String phone,
    @required String age,
    String image,
    String cover,
  }) {
    UserModel model = UserModel(
      name: name,
      phone: phone,
      uId: uId,
      email: userModel.email,
      image: image ?? userModel.image,
      cover: cover ?? userModel.cover,
      age: age,

    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getData();
    }).catchError((erorr) {
      print(erorr.toString());
    });
  }


  Future delay(int scnd)async{
    await Future.delayed(Duration(seconds: scnd));
  }
}
