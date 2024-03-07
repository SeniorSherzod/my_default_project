import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static SharedPreferences? _preferences;
  static final StorageRepository instance = StorageRepository._();

  StorageRepository._() {
    _init();
  }

  factory StorageRepository() => instance;

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setInt({
    required String key,
    required int value,
  }) async {
    if (_preferences != null) {
      _preferences!.setInt(key, value);
    }
  }

  static getInt({required String key}) async {
    if (_preferences != null) {
      return _preferences!.getInt(key) ?? 0;
    }
    return 0;
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    if (_preferences != null) {
      _preferences!.setString(key, value);
    }
  }

  static getString({required String key}) async {
    if (_preferences != null) {
      return _preferences!.getString(key) ?? "";
    }
    return "";
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    if (_preferences != null) {
      _preferences!.setBool(key, value);
    }
  }

  static bool getBool({required String key}) {
    if (_preferences != null) {
      return _preferences!.getBool(key) ?? false;
    }
    return false;
  }

  static Future<void> setDouble({
    required String key,
    required double value,
  }) async {
    if (_preferences != null) {
      _preferences!.setDouble(key, value);
    }
  }

  static double getDouble({required String key}) {
    if (_preferences != null) {
      return _preferences!.getDouble(key) ?? 0.0;
    }
    return 0.0;
  }

  static Future<void> setListString({
    required String key,
    required List<String> values,
  }) async {
    if (_preferences != null) {
      _preferences!.setStringList(key, values);
    }
  }

  static List<String> getListString({required String key}) {
    if (_preferences != null) {
      return _preferences!.getStringList(key) ?? [];
    }
    return [];
  }
}
