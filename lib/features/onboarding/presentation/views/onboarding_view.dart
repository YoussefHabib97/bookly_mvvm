import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:bookly_mvvm/core/settings/presentation/views/widgets/theme_switcher.dart';
import 'package:bookly_mvvm/core/themes/cubit/theme_cubit.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView(
                  children: const [
                    ThemeOnboardingScreen(),
                  ],
                ),
              ),
              Animate(
                child: FilledButton(
                  onPressed: () {
                    AppRouter.router.go(AppRouter.kHomeView);
                  },
                  child: const Text("Next"),
                ),
              ).fadeIn(
                delay: const Duration(milliseconds: 2500),
                duration: const Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
                Prefs.instance!.getString(kAppThemeKey) == kAppThemeLight
                    ? 'Light Theme'
                    : Prefs.instance!.getString(kAppThemeKey) == kAppThemeDark
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
