import 'package:flutter/material.dart';
import '../core/core_repository.dart';
import '../helpers/constants.dart';

class ThemeService {
  final CoreRepository _repository;

  ThemeService(CoreRepository repository) : _repository = repository;

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.white,
        accentColor: Colors.deepPurpleAccent,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Constants.backgroudColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
      );

  ThemeData get darkTheme => ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.black,
        accentColor: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
        ),
      );

  Future<ThemeData> getTheme() async {
    final themeKey = await _repository.findOne(Constants.THEME_MODE);
    if (themeKey == null) {
      return lightTheme;
    } else {
      return themeKey == Constants.THEME_LIGHT ? lightTheme : darkTheme;
    }
  }

  Future<String> getActualTheme() async {
    final themeKey = await _repository.findOne(Constants.THEME_MODE);
    return themeKey;
  }

  Future<ThemeData> changeTheme(String actualTheme) async {
    String newTheme;
    var theme;
    if (actualTheme == Constants.THEME_LIGHT) {
      theme = darkTheme;
      newTheme = Constants.THEME_DARK;
    }

    if (actualTheme == Constants.THEME_DARK) {
      theme = lightTheme;
      newTheme = Constants.THEME_LIGHT;
    }
    _repository.insert(Constants.THEME_MODE, newTheme);
    return theme;
  }
}
