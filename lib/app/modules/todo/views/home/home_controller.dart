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
  List<Task> listTask = [];

  @action
  Future<void> getTaskList() async {
    listTask = await _taskModel.listAll();
  }

  // _HomeControllerBase(this.repository) {
  //   listAll;
  // }

  // @observable
  // int quantidadeTasks = 0;

  // @action
  // getListTasks() {}

  // Future<List<Task>> get listAll async => listTask = await repository.listAll();

  // set totalTasks(int value) => quantidadeTasks = value;
  // int get totalTasks => quantidadeTasks;
}
