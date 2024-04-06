import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';

part 'theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitialState());

  Set<ThemeState> getThemeState() {
    switch (prefs!.getString(kAppThemeKey)) {
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
        prefs!.setString(kAppThemeKey, kAppThemeLight);
        emit(LightThemeState());
      case ThemeState.dark:
        prefs!.setString(kAppThemeKey, kAppThemeDark);
        emit(DarkThemeState());
      default:
        prefs!.setString(kAppThemeKey, kAppThemeDeviceDefault);
        emit(DeviceDefaultThemeState());
    }
  }
}
