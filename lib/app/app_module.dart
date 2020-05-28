import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/app_model.dart';
import 'modules/todo/todo_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => AppController(i.get<AppModel>())), Bind((i) => AppModel())];

  @override
  List<Router> get routers => [
        Router('/', module: TodoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
