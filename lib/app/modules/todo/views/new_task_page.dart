import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/app/helpers/constants.dart';
import 'package:todo_app/app/modules/todo/controller/task_controller.dart';
import 'package:todo_app/app/modules/todo/model/Task.dart';

import 'widgets/form_task.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  NewTaskController _taskController = NewTaskController();
  PageController _pageViewController = PageController(initialPage: 0);

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

    @override
    void dispose() {
      _pageViewController.dispose();
      super.dispose();
    }

    void saveTask(String titulo, String descricao) {
      _taskController.initPageTrue();

      var newTask =
          Task(titulo: titulo, descricao: descricao, isExecutada: false);
      newTask.insert();
    }

    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: Contants.BACKGROUND_COLOR,
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
    backgroundColor: Contants.BACKGROUND_COLOR,
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
