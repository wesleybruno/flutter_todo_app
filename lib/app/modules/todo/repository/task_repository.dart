import '../../../data/shared_preferences.dart';
import '../../../interfaces/repository_interface.dart';
import '../model/Task.dart';

class TaskRepository implements RepositoryInterface<Task> {
  List<Task> listTask = [];

  @override
  Future<Task> findOne(int position) async {
    var sharedPref = SharedPref();
    var listTask = await sharedPref.read("todo_list");

    return listTask[position];
  }

  @override
  Future<bool> insert(Task task) async {
      var sharedPref = SharedPref();
      await sharedPref.save("todo_list", task.toJson());
      return true;
  }

  @override
  Future<List<Task>> listAll() async {
    var sharedPref = SharedPref();
    var listShared = await sharedPref.read("todo_list");

    List<Task> list = [];
    list.add(Task.fromJson(listShared));

    return list;
  }
}
