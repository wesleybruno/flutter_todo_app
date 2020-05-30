import '../../../interfaces/model_interface.dart';
import '../../../interfaces/repository_task_interface.dart';
import '../repository/task_repository.dart';

class Task implements ModelInterface<Task> {
  RepositoryTaskInterface repository = TaskRepository();

  int _id;
  String _titulo;
  String _descricao;
  String _isExecutada;

  int get id => _id;

  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  String get titulo => _titulo;
  set titulo(String titulo) => _titulo = titulo;
  String get isExecutada => _isExecutada;
  set isExecutada(String isExecutada) => _isExecutada = _isExecutada;

  Task({String titulo, String descricao, String isExecutada}) {
    _titulo = titulo;
    _descricao = descricao;
    _isExecutada = isExecutada;
  }

  Future<Task> find(int taskId) async {
    return await repository.findOne(taskId);
  }

  Future<void> excluir() async {
    await repository.remove(id);
  }

  Future<void> finalizar() async {
    await repository.finalizar(this);
  }

  Task.fromJson(Map<String, dynamic> json)
      : _titulo = json['titulo'],
        _descricao = json['descricao'],
        _isExecutada = json['isExecutada'],
        _id = json['id'];

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();

    data["titulo"] = titulo;
    data["descricao"] = descricao;
    data["isExecutada"] = isExecutada;
    data["id"] = id;

    return data;
  }

  @override
  Future<List<Task>> listAll() async {
    var listDb = await repository.listAll();
    return listDb;
  }

  @override
  Future<Task> insert() async {
    await repository.insert(this);
    return this;
  }
}
