import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitialState());

  Set<ThemeState> getThemeState() {
    switch (SharedPrefs.instance.getString(kAppThemeKey)) {
      case kAppThemeLight:
        return {ThemeState.light};

      case kAppThemeDark:
        return {ThemeState.dark};

      default:
        return {ThemeState.deviceDefault};
    }
  }

  void setTheme(ThemeState state) {
    switch (state) {
      case ThemeState.light:
        SharedPrefs.setData(key: kAppThemeKey, value: kAppThemeLight);
        emit(LightThemeState());
      case ThemeState.dark:
        SharedPrefs.setData(key: kAppThemeKey, value: kAppThemeDark);
        emit(DarkThemeState());
      default:
        SharedPrefs.setData(key: kAppThemeKey, value: kAppThemeDeviceDefault);
        emit(DeviceDefaultThemeState());
    }
  }
}
