import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? instance;

  Future<bool> getIsFirstTime() async {
    bool isAppFirstRun = await IsFirstRun.isFirstRun();
    return isAppFirstRun;
  }
}
