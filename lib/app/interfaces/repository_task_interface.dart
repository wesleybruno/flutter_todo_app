abstract class RepositoryTaskInterface<T> {
  Future<bool> insert(T model);
  Future<List<T>> listAll();
  Future<T> findOne(int key);
  Future<bool> remove(int key);
  Future<bool> update(T model);
  Future<bool> finalizar(T model);
}
