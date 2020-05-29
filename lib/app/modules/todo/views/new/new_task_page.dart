import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../helpers/constants.dart';
import '../home/home_controller.dart';
import './task_controller.dart';
import 'widgets/form_task.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final HomeController homeController = Modular.get<HomeController>();
  final NewTaskController _taskController = Modular.get<NewTaskController>();
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
      _taskController.saveTask(titulo, descricao);
      homeController.getTaskList();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(),
        title: Text(
          "New Task",
        ),
        elevation: 0,
      ),
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
