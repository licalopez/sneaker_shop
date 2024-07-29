import 'package:flutter/material.dart';
import 'package:sneakers_shop/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightMode;

  ThemeData get currentTheme => _currentTheme;

  set currentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_currentTheme == lightMode) {
      currentTheme = darkMode;
    } else {
      currentTheme = lightMode;
    }
  }
}