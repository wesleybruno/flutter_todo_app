import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_app/app/modules/todo/todo_module.dart';

import 'app_widget.dart';


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
