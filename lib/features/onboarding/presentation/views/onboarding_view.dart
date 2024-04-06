import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:bookly_mvvm/features/onboarding/presentation/views/widgets/theme_onboarding_screen.dart';

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
                    CacheData.setData(
                        key: CacheData.kIsAppFirstRunKey, value: false);
                    AppRouter.router.go(AppRouter.kHomeView);
                  },
                  child: const Text("Confirm"),
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
