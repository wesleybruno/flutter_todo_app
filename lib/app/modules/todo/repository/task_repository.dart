import 'package:todo_app/app/data/shared_preferences.dart';
import 'package:todo_app/app/interfaces/repository_interface.dart';

import 'package:todo_app/app/modules/todo/model/Task.dart';

class TaskRepository implements RepositoryInterface<Task> {
  List<Task> listTask = [];

  @override
  Future<Task> findOne(int position) async {
    var sharedPref = new SharedPref();
    var listTask = await sharedPref.read("todo_list");

    return listTask[position];
  }

  @override
  Future<bool> insert(Task task) async {
    try {
      var sharedPref = new SharedPref();
      await sharedPref.save("todo_list", task.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Task>> listAll() async {
    var sharedPref = new SharedPref();
    var listShared = await sharedPref.read("todo_list");

    List<Task> list = List();
    list.add(Task.fromJson(listShared));

    return list;
  }
}
