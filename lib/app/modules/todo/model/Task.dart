import '../../../interfaces/model_interface.dart';
import '../../../interfaces/repository_interface.dart';
import '../repository/task_repository.dart';

class Task implements ModelInterface<Task> {
  RepositoryInterface repository = TaskRepository();

  int _id;
  String _titulo;
  String _descricao;
  bool _isExecutada;

  int get id => _id;

  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  String get titulo => _titulo;
  set titulo(String titulo) => _titulo = titulo;
  bool get isExecutada => _isExecutada;
  set isExecutada(bool sExecutada) => _isExecutada = _isExecutada;

  Task({String titulo, String descricao, bool isExecutada}) {
    this._titulo = titulo;
    this._descricao = descricao;
    this._isExecutada = isExecutada;
  }

  Future<Task> find(int taskId) async {
    return await repository.findOne(taskId);
  }

  Future<void> excluir(int taskId) async {
    await repository.remove(taskId);
  }

  Future<void> finalizar(int taskId, Task task) async {
    await repository.update(taskId, task);
  }

  Task.fromJson(Map<String, dynamic> json)
      : _titulo = json['titulo'],
        _descricao = json['descricao'],
        _isExecutada = json['isExecutada'] == true,
        _id = json['id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'isExecutada': isExecutada,
      };

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
