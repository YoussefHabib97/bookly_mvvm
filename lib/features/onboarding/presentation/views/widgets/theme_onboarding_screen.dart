import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/theme_switcher.dart';
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
            Animate(
              child: const Text(
                "Choose your preferred theme",
                style: TextStyle(fontSize: 18),
              ),
            ).fadeIn(
              delay: const Duration(seconds: 2),
              duration: const Duration(milliseconds: 500),
            ),
            const SizedBox(height: 32),
            Animate(
              child: const ThemeSwitcher(),
            ).fadeIn(
              delay: const Duration(milliseconds: 2500),
              duration: const Duration(milliseconds: 500),
            ),
            const SizedBox(height: 16),
            Animate(
              child: Text(
                CacheData.getData(key: kAppThemeKey) == kAppThemeLight
                    ? 'Light Theme'
                    : CacheData.getData(key: kAppThemeKey) == kAppThemeDark
                        ? 'Dark Theme'
                        : 'System Default',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).fadeIn(
              delay: const Duration(milliseconds: 2500),
              duration: const Duration(milliseconds: 500),
            ),
          ],
        );
      },
    );
  }
}