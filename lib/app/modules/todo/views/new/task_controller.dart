import 'package:mobx/mobx.dart';
import '../../model/Task.dart';
part 'task_controller.g.dart';

class NewTaskController = _NewTaskControllerBase with _$NewTaskController;

abstract class _NewTaskControllerBase with Store {

  @observable
  bool isInitPage = true;

  @action
  bool initPageFalse() => isInitPage = false;

  @action
  bool initPageTrue() => isInitPage = true;

  void saveTask(String titulo, String descricao) {
    var task = Task(titulo: titulo, descricao: descricao, isExecutada: false);
    task.insert();
  }
}
