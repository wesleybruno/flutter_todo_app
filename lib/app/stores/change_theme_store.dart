import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../helpers/constants.dart';
import '../service/theme_service.dart';

part 'change_theme_store.g.dart';

class ChangeTheme = _ChangeThemeBase with _$ChangeTheme;

abstract class _ChangeThemeBase with Store {
  ThemeService _themeService;

  _ChangeThemeBase(ThemeService themeService) {
    _themeService = themeService;
    getActualTheme();
    loadTheme();
  }

  @observable
  ThemeData themeApp;

  @observable
  String actualTheme;

  @observable
  bool isDark = false;

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
