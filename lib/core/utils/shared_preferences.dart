import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences instance;

  static const String kIsAppFirstRunKey = 'appIsFirstRun';
  static late bool isAppFirstRun;

  static const kFavoriteItems = 'favoriteItems';

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
    await getIsAppFirstRun();
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
    if (value is List<String>) {
      await instance.setStringList(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return instance.get(key);
  }

  static void removeData({required String key}) {
    instance.remove(key);
  }

  static void clearPrefs() {
    instance.clear();
  }

  static Future<bool?> getIsAppFirstRun() async {
    if (instance.get(kIsAppFirstRunKey) == null ||
        instance.get(kIsAppFirstRunKey) == true) {
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
