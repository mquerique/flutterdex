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
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
    ),
    textTheme: theme.textTheme.copyWith(
      bodyLarge: theme.textTheme.bodyLarge!.copyWith(fontSize: 24),
      bodyMedium: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
      bodySmall: theme.textTheme.bodySmall!.copyWith(fontSize: 16),
    ),
  );
}

enum AppTheme {
  light,
  dark,
}
