import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';

class CacheData {
  static late SharedPreferences prefsInstance;

  static const String kIsAppFirstRunKey = 'appIsFirstRun';
  static late bool isAppFirstRun;

  static Future<void> prefInit() async {
    prefsInstance = await SharedPreferences.getInstance();
    getIsAppFirstRun();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await prefsInstance.setInt(key, value);
      return true;
    }
    if (value is double) {
      await prefsInstance.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await prefsInstance.setBool(key, value);
      return true;
    }
    if (value is String) {
      await prefsInstance.setString(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return prefsInstance.get(key);
  }

  static void deleteKey({required String key}) {
    prefsInstance.remove(key);
  }

  static void clearPrefs() {
    prefsInstance.clear();
  }

  static bool? getIsAppFirstRun() {
    setData(key: kAppThemeKey, value: kAppThemeDeviceDefault);
    if (prefsInstance.get(kIsAppFirstRunKey) == null) {
      isAppFirstRun = true;
      // setData(key: _kIsAppFirstRunKey, value: isAppFirstRun);
      return isAppFirstRun;
    }
    isAppFirstRun = false;
    // setData(key: _kIsAppFirstRunKey, value: isAppFirstRun);
    return isAppFirstRun;
  }
}
