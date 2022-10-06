import 'package:flutter/material.dart';

class ChangeThemes extends ChangeNotifier {
  bool _isDark = false;
  int _valueGroup = 2;

  get isDark => _isDark;
  get valueGroup => _valueGroup;

  set switchTheme(bool value) {
    _isDark = value;
    notifyListeners();
  }

  set switchValueGroup(int value) {
    _valueGroup = value;
    notifyListeners();
  }

  ThemeMode get themeChoose => _isDark ? ThemeMode.dark : ThemeMode.light;
}
