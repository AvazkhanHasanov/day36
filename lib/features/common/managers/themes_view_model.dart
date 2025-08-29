import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  void changeTheme() {
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    print('ozgarish $mode');
    notifyListeners();
  }
}
