import 'package:mobx/mobx.dart';
import 'service/theme_service.dart';
import 'stores/change_theme_store.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  ThemeService _themeService;
  ChangeTheme themeStore;

  _AppControllerBase(ThemeService themeService) {
    _themeService = themeService;
    themeStore = ChangeTheme(_themeService);
  }
}
