import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

import 'modules/todo/todo_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', module: TodoModule()),

      ];

  @override
  Widget get bootstrap => AppWidget();
}
