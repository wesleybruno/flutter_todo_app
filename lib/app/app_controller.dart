import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'core/app_model.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  AppModel _appModel;

  _AppControllerBase(AppModel appModel) {
    _appModel = appModel;
    loadDarkMode();
  }

  @observable
  bool isDark = false;

  @action
  void setDarkMode(bool value) async {
    isDark = value;
    await _appModel.setDarkMode(value);
  }

  @action
  Future<void> loadDarkMode() async {
    var sharedMode = await _appModel.getDarkMode();
    if (sharedMode != null && sharedMode is bool) {
      isDark = sharedMode;
    }
  }
}
