import 'package:mobx/mobx.dart';
part 'task_controller.g.dart';

class NewTaskController = _NewTaskControllerBase with _$NewTaskController;

abstract class _NewTaskControllerBase with Store {
  @observable
  bool isInitPage = true;

  @action
  initPageFalse() => isInitPage = false;

  @action
  initPageTrue() => isInitPage = true;
}
