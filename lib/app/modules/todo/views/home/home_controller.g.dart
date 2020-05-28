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

  final _$getTaskListAsyncAction =
      AsyncAction('_HomeControllerBase.getTaskList');

  @override
  Future<void> getTaskList() {
    return _$getTaskListAsyncAction.run(() => super.getTaskList());
  }

  @override
  String toString() {
    return '''
listTask: ${listTask}
    ''';
  }
}
