abstract class LocalStorageInterface {
  Future read(String key);
  void save(dynamic value);
  void update(String key, dynamic value);
  void remove(String key);
}
