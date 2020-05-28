import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../helpers/constants.dart';
import '../../model/Task.dart';
import './task_controller.dart';


import 'widgets/form_task.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final NewTaskController _taskController = NewTaskController();
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    void initialPage() {
      _pageViewController.jumpToPage(0);
      _taskController.initPageTrue();
    }

    void nextPage() {
      _pageViewController.jumpToPage(1);
      _taskController.initPageFalse();
    }

    void saveTask(String titulo, String descricao) {
      _taskController.initPageTrue();

      var newTask =
          Task(titulo: titulo, descricao: descricao, isExecutada: false);
      newTask.insert();
    }

    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: Contants.backgroudColor,
      body: FormTask(
        taskController: _taskController,
        pageViewController: _pageViewController,
        onSubmit: saveTask,
      ),
      floatingActionButton: _getFloatingActionButton(
        _taskController,
        nextPage,
        initialPage,
      ),
    );
  }
}

Widget _getAppBar() {
  return AppBar(
    title: Text(
      "New Task",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Contants.backgroudColor,
    elevation: 0,
  );
}

Widget _getFloatingActionButton(_taskController, nextPage, initialPage) {
  return FloatingActionButton(
    onPressed: () {
      _taskController.isInitPage ? nextPage() : initialPage();
    },
    child: Observer(
      builder: (_) => Icon(
        _taskController.isInitPage
            ? Icons.arrow_forward_ios
            : Icons.arrow_back_ios,
      ),
    ),
  );
}
