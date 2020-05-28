import 'package:mobx/mobx.dart';
import '../../model/Task.dart';
import '../../repository/task_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TaskRepository repository;
  
  _HomeControllerBase(this.repository) {
    listAll;
  }

  @observable
  List<Task> listTask = [];

  @observable
  int quantidadeTasks = 0;

  Future<List<Task>> get listAll async => listTask = await repository.listAll();
  
  set totalTasks(int value) => quantidadeTasks = value;
  int get totalTasks => quantidadeTasks;

}
