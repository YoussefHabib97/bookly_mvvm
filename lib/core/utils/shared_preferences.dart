import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';

class SharedPrefs {
  static late SharedPreferences instance;

  static const String kIsAppFirstRunKey = 'appIsFirstRun';
  static late bool isAppFirstRun;

  static Future<void> prefInit() async {
    instance = await SharedPreferences.getInstance();
    getIsAppFirstRun();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await instance.setInt(key, value);
      return true;
    }
    if (value is double) {
      await instance.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await instance.setBool(key, value);
      return true;
    }
    if (value is String) {
      await instance.setString(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return instance.get(key);
  }

  static void deleteKey({required String key}) {
    instance.remove(key);
  }

  static void clearPrefs() {
    instance.clear();
  }

  static bool? getIsAppFirstRun() {
    if (instance.get(kIsAppFirstRunKey) == null) {
      isAppFirstRun = true;
      setData(key: kIsAppFirstRunKey, value: isAppFirstRun);
      setData(key: kAppThemeKey, value: kAppThemeDeviceDefault);
      return isAppFirstRun;
    } else {
      isAppFirstRun = false;
      setData(key: kIsAppFirstRunKey, value: isAppFirstRun);
      return isAppFirstRun;
    }
  }
}
