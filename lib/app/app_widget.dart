import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';

class AppWidget extends StatelessWidget {
  final AppController appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TodoApp List',
        theme: appController.themeApp,
        navigatorKey: Modular.navigatorKey,
        initialRoute: "/",
        onGenerateRoute: Modular.generateRoute,
      );
    });
  }
}
