// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:shared_resources/src/values/radius.dart';
import 'package:shared_resources/src/values/theme_colors.dart';

abstract class Themes {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: ThemeColors.white,
    elevation: 0.0,
    shadowColor: Colors.transparent,
  );

  static final ElevatedButtonThemeData primaryButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: ThemeColors.primary,
      elevation: 0.0,
      shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: ThemeColors.primary,
      elevation: 0.0,
      shadowColor: Colors.transparent,
    ),
  );
}
