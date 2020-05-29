import '../../../data/sqflite.dart';
import '../../../interfaces/repository_task_interface.dart';

import '../model/Task.dart';

class TaskRepository implements RepositoryTaskInterface<Task> {
  List<Task> listTask = [];

  SqFlite sqflite;
  TaskRepository() {
    sqflite = SqFlite();
  }

  @override
  Future<Task> findOne(int id) async {
    var table = "Task";
    var columns = ["id", "titulo", "descricao", "isExecutada"];
    var where = "id=?";
    var whereArgs = ["$id"];

    var resultSet = await sqflite.read(table, columns, where, whereArgs);

    var task = Task.fromJson(resultSet[0]);

    return task;
  }

  @override
  Future<bool> insert(Task task) async {
    var insert =
        "insert into Task(titulo, descricao, isExecutada) values (?,?,?)";
    var values = ["${task.titulo}", "${task.descricao}", "false"];

    await sqflite.insert(insert, values);

    return true;
  }

  @override
  Future<List<Task>> listAll() async {
    var table = "Task";
    var columns = ["id", "titulo", "descricao", "isExecutada"];
    var where = "id>?";
    var whereArgs = ["0"];

    var lista = await sqflite.read(table, columns, where, whereArgs);
    List<Task> returnLit = [];

    for (var item in lista) {
      returnLit.add(Task.fromJson(item));
    }

    return returnLit;
  }

  @override
  Future<bool> remove(int key) async {
    var query = "DELETE from Task where id = ?";

    return await sqflite.delete(key, query);
  }

  @override
  Future<bool> update(Task task) async {
    // var query = "UPDATE Task SET isExecutada = ? where id = ?";
    // var values = ["${!task.isExecutada}", "${task.id}"];

    var where = "id = ?";
    var whereArgs = ["${task.id}"];

    return await sqflite.update("Task", task.toJson(), where, whereArgs);
  }

  @override
  Future<bool> finalizar(Task task) async {
    var query = "UPDATE Task SET isExecutada = true where id = ?";
    var values = ["${!task.isExecutada}", "${task.id}"];

    return await sqflite.rawUpdate(query, values);
  }
}
