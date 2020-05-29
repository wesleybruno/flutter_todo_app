import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../model/Task.dart';
import '../home/home_controller.dart';
part 'task_controller.g.dart';

class NewTaskController = _NewTaskControllerBase with _$NewTaskController;

abstract class _NewTaskControllerBase with Store {
  final HomeController homeController = Modular.get<HomeController>();

  @observable
  bool isInitPage = true;

  @action
  bool initPageFalse() => isInitPage = false;

  @action
  bool initPageTrue() => isInitPage = true;

  void saveTask(String titulo, String descricao) async {
    var task = Task(titulo: titulo, descricao: descricao, isExecutada: false);
    await task.insert();
    await homeController.getTaskList();
  }
}
