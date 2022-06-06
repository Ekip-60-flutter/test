import 'package:shared_preferences/shared_preferences.dart';

class LoginProcess{

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<dynamic> readData(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(key);
  }

  Future<dynamic> isLogin() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool('isLogin');
  }

  writeLogin(bool data) async {
    final SharedPreferences prefs = await _prefs;

    return await prefs.setBool('isLogin', data);
  }

  writeData(String key, String data) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(key, data);
  }

  removeData(String key) async {
    final SharedPreferences prefs = await _prefs;

    final success = await prefs.remove(key);
    if(success) return true;
    return false;
  }
}