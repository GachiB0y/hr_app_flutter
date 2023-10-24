import 'package:flutter/material.dart';
import 'package:hr_app_flutter/theme/colors_from_theme.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkTheme {
    return _isDarkTheme;
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: ColorsForWidget.colorGreen,
      scaffoldBackgroundColor: Colors.white,
      textTheme: ThemeData.light().textTheme,
      iconTheme: const IconThemeData(color: Colors.black),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsForWidget.colorGreen,
          primary: ColorsForWidget.colorGreen),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: ColorsForWidget.colorGreen,
      scaffoldBackgroundColor: const Color.fromARGB(206, 54, 54, 54),
      textTheme: ThemeData.dark().textTheme,
      iconTheme: const IconThemeData(color: Colors.white),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorsForWidget.colorGreen),
    );
  }
}
