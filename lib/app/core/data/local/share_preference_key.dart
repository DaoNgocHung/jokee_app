import 'package:shared_preferences/shared_preferences.dart';

enum SharedPreferenceKeys {
  currentIndexKey,
}

class SharedPreference {
  static final SharedPreference _instance = SharedPreference._internal();
  static late SharedPreferences _preferences;

  factory SharedPreference() {
    return _instance;
  }

  SharedPreference._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setInt(SharedPreferenceKeys key, int value) async {
    await _preferences.setInt(key.toString(), value);
  }

  static int getInt(SharedPreferenceKeys key, int defaultValue) {
    return _preferences.getInt(key.toString()) ?? defaultValue;
  }
}
