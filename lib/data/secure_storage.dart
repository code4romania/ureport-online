import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  static FutureOr<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getString(String key) {
    return _preferences?.getString(key);
  }

  static Future<bool>? putString(String key, String value) {
    return _preferences?.setString(key, value);
  }
}
