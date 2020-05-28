import '../interfaces/local_storage_interface.dart';

class SqFlite implements LocalStorageInterface {
  @override
  Future read(String key) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  void remove(String key) {
    // TODO: implement remove
  }

  @override
  void save(keyue) {
    // TODO: implement save
  }

  @override
  void update(String key, value) {
    // TODO: implement update
  }

  Future readAll() {}
}
