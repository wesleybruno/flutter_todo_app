import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../interfaces/local_storage_interface.dart';

class SharedPref implements LocalStorageInterface {
  @override
  Future read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  @override
  void remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  void save(dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(value.toString(), json.encode(value));
  }

  @override
  void update(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }
}
