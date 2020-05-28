import 'package:mobx/mobx.dart';
import 'package:todo_app/app/modules/todo/model/Task.dart';
import 'package:todo_app/app/modules/todo/repository/task_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final TaskRepository repository;
  
  _HomeControllerBase(this.repository) {
    getList();
  }

  @observable
  List<Task> listTask = [];

  @observable
  var quantidadeTasks = 0;

  @action
  getList() async{
    listTask = await repository.listAll();
  }

  @action
  setQuantidadeTasks(value) => quantidadeTasks = value;

}
