import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.dark();
  ThemeData get theme => _theme;
  void ChangeTheme() {
    final isDark = theme == ThemeData.dark();
    if (isDark) {
      _theme = ThemeData.light();
    } else {
      _theme = ThemeData.dark();
    }
    notifyListeners();
  }
}
