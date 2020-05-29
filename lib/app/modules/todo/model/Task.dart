import '../../../interfaces/model_interface.dart';
import '../../../interfaces/repository_interface.dart';
import '../repository/task_repository.dart';

class Task implements ModelInterface<Task> {
  RepositoryInterface repository = TaskRepository();

  String _titulo;
  String _descricao;
  bool _isExecutada;

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

  Task.fromJson(Map<String, dynamic> json)
      : _titulo = json['titulo'],
        _descricao = json['descricao'],
        _isExecutada = json['isExecutada'] == true;

  Map<String, dynamic> toJson() => {
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

  @override
  String toString() {
    return "$descricao $titulo";
  }
}
