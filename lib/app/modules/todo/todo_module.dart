import 'package:flutter_modular/flutter_modular.dart';
import 'model/Task.dart';
import 'views/edit/edit_task_controller.dart';
import 'views/edit/edit_task_page.dart';
import 'views/home/home_controller.dart';
import 'views/home/home_page.dart';
import 'views/new/new_task_page.dart';
import 'views/new/task_controller.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<Task>())),
        Bind((i) => EditTaskController()),
        Bind((i) => NewTaskController()),
        Bind((i) => Task()),
      ];

  @override
  List<Router> get routers => [
        Router('/list-task', child: (_, __) => HomePage()),
        Router('/new-task', child: (_, __) => NewTaskPage()),
        Router('/edit-task/:taskId',
            child: (_, args) => EditTaskPage(taskId: args.params["taskId"])),
      ];
}
