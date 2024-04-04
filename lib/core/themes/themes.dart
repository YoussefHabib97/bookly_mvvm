import 'package:flutter/material.dart';

enum ThemeState {
  deviceDefault,
  light,
  dark,
}

ThemeData lightTheme = ThemeData(
  colorSchemeSeed: Colors.deepPurple,
  brightness: Brightness.light,
  useMaterial3: true,
);

ThemeData darkTheme = lightTheme.copyWith(brightness: Brightness.dark);
