import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingletoon {
  final SharedPreferences _sharedPreferences;

  SharedPrefSingletoon(this._sharedPreferences);
  String? getString(String key) => _sharedPreferences.getString(key);
  Future<bool> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);
  bool? getBool(String key) => _sharedPreferences.getBool(key);
  Future<bool> setBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);
}
