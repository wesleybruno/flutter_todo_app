import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../helpers/constants.dart';
import './home_controller.dart';

import 'widgets/task_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Contants.backgroudColor,
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
