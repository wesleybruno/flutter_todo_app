import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../task_controller.dart';

class FormTask extends StatelessWidget {
  final PageController pageViewController;
  final NewTaskController taskController;
  final _textTituloController = TextEditingController();
  final _textDescricaoController = TextEditingController();

  final Function onSubmit;

  FormTask({this.taskController, this.pageViewController, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          child: PageView(
            controller: pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              _getFirstPage(_textTituloController),
              _getSecondPage(_textDescricaoController),
            ],
          ),
        ),
        Observer(
          builder: (_) => Container(
            height: MediaQuery.of(context).size.height / 15,
            child: taskController.isInitPage
                ? Container()
                : _getButtonSalvar(context, _textTituloController,
                    _textDescricaoController, onSubmit),
          ),
        ),
      ],
    );
  }
}

Widget _getButtonSalvar(
    context, _textTituloController, _textDescricaoController, onSubmit) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12),
    width: double.infinity,
    child: RaisedButton(
      color: Theme.of(context).accentColor,
      onPressed: () {
        Modular.to.pushNamed('/');
        onSubmit(
          _textTituloController.text,
          _textDescricaoController.text,
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        "Salvar",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  );
}

Widget _getFirstPage(_textTituloController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: _textTituloController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Informe o titulo",
        hintStyle: TextStyle(
          fontSize: 40,
        ),
      ),
      style: TextStyle(
        fontSize: 40,
      ),
    ),
  );
}

Widget _getSecondPage(_textDescricaoController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: _textDescricaoController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Informe a descricao",
        hintStyle: TextStyle(
          fontSize: 40,
        ),
      ),
      style: TextStyle(
        fontSize: 40,
      ),
    ),
  );
}
