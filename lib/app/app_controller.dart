import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'helpers/constants.dart';
import 'service/theme_service.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  ThemeService _themeService;

  _AppControllerBase(ThemeService themeService) {
    _themeService = themeService;
    getActualTheme();
    loadTheme();
  }

  @observable
  ThemeData themeApp;

  @observable
  String actualTheme;

  // void setNewTheme(value) {
  //   return actualTheme = value;
  // }

  @observable
  bool isDark = false;

  // @observable
  // bool get isDark => actualTheme != Constants.THEME_LIGHT;

  Future<String> getActualTheme() async {
    if (actualTheme == null) {
      actualTheme = await _themeService.getActualTheme();
      isDark = actualTheme == Constants.THEME_DARK;
      return actualTheme;
    } else {
      isDark = actualTheme == Constants.THEME_DARK;
      return actualTheme;
    }
  }

  @action
  Future<void> loadTheme() async {
    var theme = await _themeService.getTheme();
    themeApp = theme;
  }

  @action
  Future<void> changeTheme(String actualTheme) async {
    var newtheme = await _themeService.changeTheme(actualTheme);

    if (actualTheme == Constants.THEME_LIGHT) {
      isDark = true;
    }

    if (actualTheme == Constants.THEME_DARK) {
      isDark = false;
    }

    themeApp = newtheme;
  }
}
