import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';
import 'package:flutterlab/app/app_style.dart';

/// App Theme 정의
class AppTheme {
  // Light Theme
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.lightBackground,
    textTheme: textTheme(true),
  );

  // Dark Theme
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.darkBackground,
    textTheme: textTheme(false),
  );

  static TextTheme textTheme(bool isLight) {
    return TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppStyle.largeTextSize,
        fontWeight: FontWeight.w700,
        color: isLight ? AppColor.lightText : AppColor.darkText,
      ),
      bodyMedium: TextStyle(
        fontSize: AppStyle.mediumTextSize,
        fontWeight: FontWeight.w500,
        color: isLight ? AppColor.lightText : AppColor.darkText,
      ),
      bodySmall: TextStyle(
        fontSize: AppStyle.smallTextSize,
        fontWeight: FontWeight.w400,
        color: isLight ? AppColor.lightText : AppColor.darkText,
      ),
    );
  }
}
