
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/screens/login/login_screen.dart';
import 'package:gdtsapp/screens/onBoarding/onboarding_screen.dart';
import 'package:gdtsapp/shared/bloc/gdts_bloc/gdts_cubit.dart';
import 'package:gdtsapp/shared/styles/themes/theme_style.dart';
import 'package:gdtsapp/shared/bloc/themes_bloc/themes_state.dart';

import 'layout/layout_gdts.dart';
import 'network/constant/constants.dart';
import 'network/local/cash_helper.dart';
import 'shared/bloc/themes_bloc/themes_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();


  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark');
  Widget widget;
  bool onBoarding = CacheHelper.getBoolean(key: 'onBoarding');
  uId = CacheHelper.getBoolean(key: 'uId');
  print(uId);
  if (onBoarding != null) {
    if (uId != null) {
      widget = GDTSLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(isDark: isDark, startWidget: widget));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  MyApp({this.isDark, this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => GdtsCubit()..getAllUsers()..getData(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
          ThemeCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ligthTheme,
            darkTheme: dartTheme,
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home: startWidget,
          );
        },
      ),
    );
  }
}
