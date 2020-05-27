abstract class RepositoryInterface<T> {
  Future<bool> insert(T model);
  Future<List<T>> listAll();
  Future<T> findOne(int position);
}
