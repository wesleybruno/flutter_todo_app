import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './task_controller.dart';
import 'widgets/form_task.dart';

class NewTaskPage extends StatefulWidget {
  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final NewTaskController _taskController = Modular.get<NewTaskController>();
  final PageController _pageViewController = PageController(initialPage: 0);
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _taskController.initPageTrue();
    _pageViewController.dispose();
    super.dispose();
  }

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
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(),
        title: Text(
          "Nova Tarefa",
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: FormTask(
          taskController: _taskController,
          pageViewController: _pageViewController,
          onSubmit: saveTask,
          formKey: formKey,
          nextPage: nextPage,
          initialPage: initialPage,
        ),
      ),
    );
  }
}
