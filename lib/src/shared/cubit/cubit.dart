

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngocanh/src/shared/cubit/states.dart';



import '../network/local/cache_helper.dart';


class AppShareCubit extends Cubit<AppStates> {
  AppShareCubit() :super(AppInitialStatue());

  static AppShareCubit get(context) => BlocProvider.of(context);








  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDarkMode = true;

  void changeAppMode({ bool ? fromShared}) {
    if (fromShared != null) {
      isDarkMode = fromShared;
      emit(ChangeAppModeState());
    } else {
      isDarkMode = !isDarkMode;
      CacheHelper.putBoolean(key: 'isDarkMode', value: isDarkMode).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }




}

