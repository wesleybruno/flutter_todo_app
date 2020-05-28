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
  Future<Task> findOne(int id) async {
    var table = "Task";
    var columns = ["id", "titulo", "descricao", "isExecutada"];
    var where = "id>?";
    var whereArgs = ["$id"];

    var task = sqflite.read(table, columns, where, whereArgs);

    return task;
  }

  @override
  Future<bool> insert(Task task) async {
    var insert =
        "insert into Task(titulo, descricao, isExecutada) values (?,?,?)";
    var values = ["${task.titulo}", "${task.descricao}", "false"];

    var response = await sqflite.insert(insert, values);

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
      returnLit.add(Task(
        titulo: item["titulo"],
        descricao: item["descricao"],
        isExecutada: item["isExecutada"].toLowerCase() == 'true',
      ));
    }

    return returnLit;
  }
}
