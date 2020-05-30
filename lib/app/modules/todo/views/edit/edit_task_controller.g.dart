// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditTaskController on _EditTaskControllerBase, Store {
  Computed<String> _$taskTituloComputed;

  @override
  String get taskTitulo =>
      (_$taskTituloComputed ??= Computed<String>(() => super.taskTitulo,
              name: '_EditTaskControllerBase.taskTitulo'))
          .value;
  Computed<String> _$taskDescricaoComputed;

  @override
  String get taskDescricao =>
      (_$taskDescricaoComputed ??= Computed<String>(() => super.taskDescricao,
              name: '_EditTaskControllerBase.taskDescricao'))
          .value;

  final _$_taskAtom = Atom(name: '_EditTaskControllerBase._task');

  @override
  Task get _task {
    _$_taskAtom.reportRead();
    return super._task;
  }

  @override
  set _task(Task value) {
    _$_taskAtom.reportWrite(value, super._task, () {
      super._task = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EditTaskControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$loadTaskAsyncAction = AsyncAction('_EditTaskControllerBase.loadTask');

  @override
  Future<void> loadTask(int taskId) {
    return _$loadTaskAsyncAction.run(() => super.loadTask(taskId));
  }

}
