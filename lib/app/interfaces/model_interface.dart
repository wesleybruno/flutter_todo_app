abstract class ModelInterface<T> {
  Future<T> insert();
  Future<List<T>> listAll();
}
