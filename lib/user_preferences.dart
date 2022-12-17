import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _taskListKey = 'tasksList';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setData(String data) async {
    await _preferences!.setString(_taskListKey, data);
  }
}
