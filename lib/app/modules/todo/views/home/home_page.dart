import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../app_controller.dart';
import '../../../../helpers/constants.dart';
import './home_controller.dart';

import 'widgets/task_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Modular.get<HomeController>();
  final AppController appController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Tasks",
          style: TextStyle(
              //color: Colors.black,
              ),
        ),
        actions: <Widget>[
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(
              appController.isDark ? Icons.brightness_5 : Icons.brightness_2,
            ),
            onPressed: () {
              appController.changeTheme(appController.isDark
                  ? Constants.THEME_DARK
                  : Constants.THEME_LIGHT);
            },
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (_) => ListView.builder(
              itemCount: homeController.listTask.length,
              itemBuilder: (ctxt, index) {
                return TaskItem(
                  onTap: () {
                    Modular.to.pushNamed('/edit-task');
                  },
                  borderColor:
                      appController.isDark ? Colors.white : Colors.black,
                  titulo: homeController.listTask[index].titulo,
                  descricao: homeController.listTask[index].descricao,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/new-task');
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

// Widget _getAppBar(appController) {
//   return AppBar(
//     iconTheme: IconThemeData(color: Colors.black),
//     title: Text(
//       "Tasks",
//       style: TextStyle(
//           //color: Colors.black,
//           ),
//     ),
//     actions: <Widget>[
//       Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Observer(builder: (_) {
//           return appController.isDark
//               ? IconButton(
//                   onPressed: () => appController.changeTheme(),
//                   icon: Icon(Icons.brightness_5))
//               : IconButton(
//                   onPressed: () => appController.changeTheme(),
//                   icon: Icon(Icons.brightness_2));
//         }),
//       )
//     ],
//     elevation: 0,
//   );
// }
