import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdtsapp/network/local/cash_helper.dart';
import 'package:gdtsapp/shared/bloc/themes_bloc/themes_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(IntizApp());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({@required bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
