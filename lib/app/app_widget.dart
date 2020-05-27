
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoApp List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Modular.navigatorKey,
      initialRoute: "/",
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
