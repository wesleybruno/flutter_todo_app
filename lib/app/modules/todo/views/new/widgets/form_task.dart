import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../task_controller.dart';

class FormTask extends StatelessWidget {
  final PageController pageViewController;
  final NewTaskController taskController;
  final _textTituloController = TextEditingController();
  final _textDescricaoController = TextEditingController();

  final GlobalKey<FormState> formKey;

  final Function onSubmit;
  final Function nextPage;
  final Function initialPage;

  FormTask({
    this.taskController,
    this.pageViewController,
    this.onSubmit,
    this.formKey,
    this.nextPage,
    this.initialPage,
  });
  @override
  void dispose() {
    _textTituloController.dispose();
    _textDescricaoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: PageView(
              controller: pageViewController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                _getFirstPage(taskController, _textTituloController, nextPage),
                _getSecondPage(_textDescricaoController),
              ],
            ),
          ),
          Observer(
            builder: (_) => Container(
              height: MediaQuery.of(context).size.height / 5,
              child: taskController.isInitPage
                  ? Container()
                  : _getButtonSalvar(
                      context,
                      _textTituloController,
                      _textDescricaoController,
                      onSubmit,
                      formKey,
                      initialPage,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _getButtonSalvar(context, _textTituloController,
    _textDescricaoController, onSubmit, formKey, initialPage) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () {
            initialPage();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            "Voltar",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () {
            if (formKey.currentState.validate()) {
              Modular.to.pop();
              onSubmit(
                _textTituloController.text,
                _textDescricaoController.text,
              );
            }
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
      ),
    ],
  );
}

Widget _getFirstPage(taskController, _textTituloController, nextPage) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Observer(builder: (_) {
      return TextFormField(
        onFieldSubmitted: (value) {
          if (value == null || value.trim().isEmpty) {
            taskController.setTituloFalse();
            return null;
          }
          taskController.setTituloTrue();
          nextPage();
        },
        autofocus: true,
        controller: _textTituloController,
        decoration: InputDecoration(
          errorText: taskController.tituloIsValid ? '' : 'Campo obrigatorio',
          border: InputBorder.none,
          hintText: "Informe o titulo",
          hintStyle: TextStyle(
            fontSize: 40,
          ),
        ),
        style: TextStyle(
          fontSize: 40,
        ),
      );
    }),
  );
}

Widget _getSecondPage(_textDescricaoController) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      autofocus: true,
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Campo obrigatorio';
        }
        return null;
      },
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
