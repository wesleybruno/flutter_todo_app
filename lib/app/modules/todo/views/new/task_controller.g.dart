// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewTaskController on _NewTaskControllerBase, Store {
  final _$isInitPageAtom = Atom(name: '_NewTaskControllerBase.isInitPage');

  @override
  bool get isInitPage {
    _$isInitPageAtom.reportRead();
    return super.isInitPage;
  }

  @override
  set isInitPage(bool value) {
    _$isInitPageAtom.reportWrite(value, super.isInitPage, () {
      super.isInitPage = value;
    });
  }

  final _$_NewTaskControllerBaseActionController =
      ActionController(name: '_NewTaskControllerBase');

  @override
  bool initPageFalse() {
    final _$actionInfo = _$_NewTaskControllerBaseActionController.startAction(
        name: '_NewTaskControllerBase.initPageFalse');
    try {
      return super.initPageFalse();
    } finally {
      _$_NewTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool initPageTrue() {
    final _$actionInfo = _$_NewTaskControllerBaseActionController.startAction(
        name: '_NewTaskControllerBase.initPageTrue');
    try {
      return super.initPageTrue();
    } finally {
      _$_NewTaskControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitPage: ${isInitPage}
    ''';
  }
}
