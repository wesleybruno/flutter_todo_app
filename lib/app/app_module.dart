import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'app_controller.dart';
import 'app_widget.dart';
import 'core/core_repository.dart';
import 'modules/todo/todo_module.dart';
import 'service/theme_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get<ThemeService>())),
        Bind((i) => ThemeService(i.get<CoreRepository>())),
        Bind((i) => CoreRepository())
      ];

  @override
  List<Router> get routers => [
        Router('/', module: TodoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
