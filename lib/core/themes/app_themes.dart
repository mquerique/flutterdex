import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.light: _baseTheme(Brightness.light).copyWith(),
  AppTheme.dark: _baseTheme(Brightness.dark).copyWith(),
};

ThemeData _baseTheme(Brightness brightness) {
  final theme = ThemeData(brightness: brightness);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.red,
      secondary: Colors.red,
      onSecondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
    ),
  );
}

enum AppTheme {
  light,
  dark,
}
