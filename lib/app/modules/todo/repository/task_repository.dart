import '../../../data/sqflite.dart';
import '../../../interfaces/repository_interface.dart';
import '../model/Task.dart';

class TaskRepository implements RepositoryInterface<Task> {
  List<Task> listTask = [];

  SqFlite sqflite;
  TaskRepository() {
    sqflite = SqFlite();
  }

  @override
  Future<Task> findOne(dynamic key) async {
    var task = sqflite.read(key);
    return task;
  }

  @override
  Future<bool> insert(Task task) async {
    sqflite.save(task);
  }

  @override
  Future<List<Task>> listAll() async {
    var listTask = [
      Task(descricao: "descricao", titulo: "titulo", isExecutada: false),
      Task(descricao: "descricao33", titulo: "titulo", isExecutada: false)
    ];
    return listTask;
    //sqflite.readAll();
  }
}
