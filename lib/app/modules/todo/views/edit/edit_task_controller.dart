import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../model/Task.dart';
import '../home/home_controller.dart';
part 'edit_task_controller.g.dart';

class EditTaskController = _EditTaskControllerBase with _$EditTaskController;

abstract class _EditTaskControllerBase with Store {
  final HomeController homeController = Modular.get<HomeController>();

  _EditTaskControllerBase();

  @observable
  Task _task;

  @computed
  String get taskTitulo => _task.titulo;

  @computed
  String get taskDescricao => _task.descricao;

  @action
  Future<void> loadTask(int taskId) async {
    _task = await Task().find(taskId);
  }

  Future<void> finalizarTask(int taskId) async {
    await Task().finalizar(taskId, _task);
    await homeController.getTaskList();
  }

  Future<void> excluirTask(int taskId) async {
    await Task().excluir(taskId);
    await homeController.getTaskList();
  }
}
