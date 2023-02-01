import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
  ),
};

enum AppTheme {
  light,
  dark,
}
