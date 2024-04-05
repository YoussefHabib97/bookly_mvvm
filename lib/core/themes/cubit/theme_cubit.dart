import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';

part 'theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(DeviceDefaultThemeState());

  void changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.light:
        sharedPreferences!.setString('theme', 'light');
        emit(LightThemeState());

      case ThemeState.dark:
        sharedPreferences!.setString('theme', 'dark');
        emit(DarkThemeState());
      default:
    }
  }
}
