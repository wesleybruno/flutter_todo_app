import 'package:mobx/mobx.dart';
import '../../model/Task.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  Task _taskModel;

  _HomeControllerBase(Task task) {
    _taskModel = task;
    getTaskList();
  }

  @observable
  List<Task> listTask = ObservableList<Task>();

  @action
  Future<void> getTaskList() async {
    listTask = await _taskModel.listAll();
  }

  Future<void> saveTask(
      String titulo, String descricao, String isExecutada) async {
    var task =
        Task(titulo: titulo, descricao: descricao, isExecutada: isExecutada);

    await task.insert();
  }
}
