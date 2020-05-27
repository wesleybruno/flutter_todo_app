import 'package:flutter_modular/flutter_modular.dart';

import 'controller/home_controller.dart';
import 'repository/task_repository.dart';
import 'views/edit_task_page.dart';
import 'views/home_page.dart';
import 'views/new_task_page.dart';

class TodoModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind( (i) => HomeController(i.get<TaskRepository>())),
    Bind( (i) => TaskRepository())
    
  ];

  @override
  List<Router> get routers => [
        Router('/list-task', child: (_, __) => HomePage()),
        Router('/new-task', child: (_, __) => NewTaskPage()),
        Router('/edit-task', child: (_, __) => EditTaskPage()),
      ];

}
