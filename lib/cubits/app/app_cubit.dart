import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_graph/cubits/app/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  void changeTheme() {
    switch (themeNotifier.value) {
      case ThemeMode.system:
        themeNotifier.value =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? ThemeMode.light
                : ThemeMode.dark;
        break;
      case ThemeMode.light:
        themeNotifier.value = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        themeNotifier.value = ThemeMode.light;
        break;
    }
  }
}