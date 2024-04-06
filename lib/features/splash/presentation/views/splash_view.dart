import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_mvvm/core/themes/cubit/theme_cubit.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/theme_switcher.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Animate(
                      child: Image.asset(
                        'assets/images/logo.png',
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                        .fadeIn(
                          delay: const Duration(milliseconds: 250),
                          duration: const Duration(milliseconds: 500),
                        )
                        .then(
                          delay: const Duration(milliseconds: 750),
                        ),
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
                        prefs!.getString(kAppThemeKey) == kAppThemeLight
                            ? 'Light Theme'
                            : prefs!.getString(kAppThemeKey) == kAppThemeDark
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
                    const SizedBox(height: 32),
                    Animate(
                      child: FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: const Text("Next"),
                      ),
                    ).fadeIn(
                      delay: const Duration(milliseconds: 2500),
                      duration: const Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
