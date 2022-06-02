import 'package:flutter/services.dart';
import 'package:shared_resources/src/values/theme_colors.dart';

abstract class StatusBarColors {
  static const SystemUiOverlayStyle primary = SystemUiOverlayStyle(
    statusBarColor: ThemeColors.primary,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle white = SystemUiOverlayStyle(
    statusBarColor: ThemeColors.white,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );
}
