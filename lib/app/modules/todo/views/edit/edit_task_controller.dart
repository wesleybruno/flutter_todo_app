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

  @observable
  bool isLoading = true;

  @computed
  String get taskTitulo => _task.titulo;

  @computed
  String get taskDescricao => _task.descricao;

  @action
  Future<void> loadTask(int taskId) async {
    _task = await Task().find(taskId);
    isLoading = false;
  }

  Future<void> finalizarTask(int taskId) async {
    var task = await Task().find(taskId);
    await task.finalizar();
    await homeController.getTaskList();
  }

  Future<void> excluirTask(int taskId) async {
    var task = await Task().find(taskId);
    await task.excluir();
    await homeController.getTaskList();
  }
}
