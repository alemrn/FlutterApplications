import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpts = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpts;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpts = i;
    notifyListeners();
  }
}
