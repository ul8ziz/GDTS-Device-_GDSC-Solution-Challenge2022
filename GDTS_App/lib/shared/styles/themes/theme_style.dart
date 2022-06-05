import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
// const Color primary = Color(0xffFE777B);

ThemeData dartTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: HexColor('080405'),
    appBarTheme: AppBarTheme(
      //backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:HexColor('0d9d8d') ,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.purple,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      //Icon search color
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: HexColor('0d9d8d'),
      unselectedItemColor: Colors.white70,
      elevation: 40.0,
      backgroundColor: HexColor('0d9d8d'),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    fontFamily: 'Jannah');

ThemeData ligthTheme = ThemeData(
  primarySwatch: Colors.blue,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.redAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    //backwardsCompatibility: false,

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: HexColor('0d9d8d'),
    ),
    backgroundColor: HexColor('0d9d8d'),
    elevation: 0.0,


    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    //Icon search color

    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor:  HexColor('054B43'),
    elevation: 50.0,
    backgroundColor: HexColor('0d9d8d'),

  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

    subtitle1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
);
