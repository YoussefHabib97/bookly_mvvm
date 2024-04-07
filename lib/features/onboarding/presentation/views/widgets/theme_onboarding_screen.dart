import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/theme_switcher_widget.dart';
import 'package:bookly_mvvm/core/themes/cubit/theme_cubit.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';

class ThemeOnboardingScreen extends StatelessWidget {
  const ThemeOnboardingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 64),
            const Text(
              "Choose your preferred theme",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            const ThemeSwitcherWidget(),
            const SizedBox(height: 16),
            Text(
              SharedPrefs.getData(key: kAppThemeKey) == kAppThemeLight
                  ? 'Light Theme'
                  : SharedPrefs.getData(key: kAppThemeKey) == kAppThemeDark
                      ? 'Dark Theme'
                      : 'System Default',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
