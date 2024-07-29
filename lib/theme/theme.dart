import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade100,
    secondary: Colors.white,
    surface: Colors.grey.shade300,
    onPrimary: Colors.grey.shade800,
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade800,
    secondary: Colors.black,  
    surface: Colors.grey.shade900,
    onPrimary: Colors.grey.shade200,
    onSurface: Colors.white,
    onSurfaceVariant: Colors.grey.shade100,
  ),
);