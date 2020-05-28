import '../data/shared_preferences.dart';

class CoreRepository {
  
  SharedPref sharedPref;
  CoreRepository(){
    sharedPref = SharedPref();
  }

  Future<bool> findOne(String key) async {
    return await sharedPref.read(key);
  }

  void insert(String key, dynamic value) async {
    sharedPref.save(key, value);
  }
  
}