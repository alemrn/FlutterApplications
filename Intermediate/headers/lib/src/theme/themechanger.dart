import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
        ;
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
        ;
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(accentColor: Colors.pink);
      ;
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
      ;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
      ;
    } else {
      _currentTheme = ThemeData.light().copyWith(accentColor: Colors.pink);
      ;
    }

    notifyListeners();
  }
}
