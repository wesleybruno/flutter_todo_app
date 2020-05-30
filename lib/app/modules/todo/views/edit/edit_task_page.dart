import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../home/home_controller.dart';

import 'edit_task_controller.dart';

class EditTaskPage extends StatefulWidget {
  final String taskId;
  EditTaskPage({@required this.taskId});

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final HomeController homeController = Modular.get<HomeController>();
  EditTaskController editTaskController = Modular.get<EditTaskController>();

  @override
  void initState() {
    super.initState();
    editTaskController.loadTask(int.tryParse(widget.taskId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Task ${widget.taskId}",
        ),
        elevation: 0,
      ),
      body: Observer(
        builder: (_) => editTaskController.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 4),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Observer(builder: (_) {
                        return Text(
                          "${editTaskController.taskTitulo}",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        );
                      }),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Observer(builder: (_) {
                        return Text(
                          "${editTaskController.taskDescricao}",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        );
                      }),
                    ),
                  ),
                  Expanded(child: Container()),
                  !editTaskController.isFinalizada
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Finalizar",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onPressed: () async {
                                await editTaskController
                                    .finalizarTask(int.tryParse(widget.taskId));
                                Modular.to.pushNamed('/list-task');
                              }),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Excluir",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          await editTaskController
                              .excluirTask(int.tryParse(widget.taskId));
                          Modular.to.pushNamed('/list-task');
                        }),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 4)
                ],
              ),
        //},
      ),
    );
  }
}
