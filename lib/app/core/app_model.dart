import 'core_repository.dart';

class AppModel {
  CoreRepository repository = CoreRepository();

  void setDarkMode(bool value) {
    repository.insert("dark_mode", value);
  }

  Future<bool> getDarkMode() async {
    return await repository.findOne("dark_mode");
  }
}
