import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../app_controller.dart';
import '../../../../helpers/constants.dart';
import './home_controller.dart';

import 'widgets/task_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get<HomeController>();
  final AppController appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Contants.backgroudColor,
      appBar: _getAppBar(appController),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (_) => ListView.builder(
              itemCount: homeController.listTask.length,
              itemBuilder: (ctxt, index) {
                return TaskItem(
                  onTap: () {
                    Modular.to.pushNamed('/edit-task');
                  },
                  titulo: homeController.listTask[index].titulo,
                  descricao: homeController.listTask[index].descricao,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/new-task');
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

Widget _getAppBar(appController) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    title: Text(
      "Tasks",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(builder: (_) {
          return appController.isDark
              ? IconButton(
                  onPressed: () => appController.setDarkMode(false),
                  icon: Icon(Icons.brightness_5))
              : IconButton(
                  onPressed: () => appController.setDarkMode(true),
                  icon: Icon(Icons.brightness_2));
        }),
      )
    ],
    backgroundColor: Contants.backgroudColor,
    elevation: 0,
  );
}
