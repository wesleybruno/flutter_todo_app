// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listTaskAtom = Atom(name: '_HomeControllerBase.listTask');

  @override
  List<Task> get listTask {
    _$listTaskAtom.reportRead();
    return super.listTask;
  }

  @override
  set listTask(List<Task> value) {
    _$listTaskAtom.reportWrite(value, super.listTask, () {
      super.listTask = value;
    });
  }

  final _$quantidadeTasksAtom =
      Atom(name: '_HomeControllerBase.quantidadeTasks');

  @override
  int get quantidadeTasks {
    _$quantidadeTasksAtom.reportRead();
    return super.quantidadeTasks;
  }

  @override
  set quantidadeTasks(int value) {
    _$quantidadeTasksAtom.reportWrite(value, super.quantidadeTasks, () {
      super.quantidadeTasks = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_HomeControllerBase.getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setQuantidadeTasks(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setQuantidadeTasks');
    try {
      return super.setQuantidadeTasks(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTask: ${listTask},
quantidadeTasks: ${quantidadeTasks}
    ''';
  }
}
