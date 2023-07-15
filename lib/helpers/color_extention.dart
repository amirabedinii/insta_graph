import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_graph/consts/colors.dart';

import '../cubits/app/app_cubit.dart';

class InstagraphColors {
  final Color backgroundColor;
  final Color materialColor;
  final Color textFieldColor;
  final Color emptyButtonColor;
  final Color nonEmptyButtonColor;
  InstagraphColors({
    required this.backgroundColor,
    required this.materialColor,
    required this.textFieldColor,
    required this.emptyButtonColor,
    required this.nonEmptyButtonColor,
  });

  factory InstagraphColors.dark() {
    return InstagraphColors(
      backgroundColor: darkBackGroundColor,
      materialColor: darkMaterialColor,
      textFieldColor: darkTextFieldColor,
      emptyButtonColor: darkBlue,
      nonEmptyButtonColor: blue,
    );
  }

  factory InstagraphColors.light() {
    return InstagraphColors(
      backgroundColor: lightBackGroundColor,
      materialColor: lightMaterialColor,
      textFieldColor: lightTextFieldColor,
      emptyButtonColor: darkBlue,
      nonEmptyButtonColor: blue,
    );
  }
}

extension InstagraphThemedata on ThemeData {
  InstagraphColors colors(BuildContext context) {
    return switch (context.watch<AppCubit>().themeNotifier.value) {
      ThemeMode.system =>
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? InstagraphColors.dark()
            : InstagraphColors.light(),
      ThemeMode.light => InstagraphColors.light(),
      ThemeMode.dark => InstagraphColors.dark(),
    };
  }
}
