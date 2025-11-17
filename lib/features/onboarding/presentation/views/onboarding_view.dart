import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:bookly_mvvm/features/onboarding/presentation/views/widgets/theme_onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: PageView(
                children: const [
                  ThemeOnboardingScreen(),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                SharedPrefs.setData(
                    key: SharedPrefs.kIsAppFirstRunKey, value: false);
                AppRouter.router.go(AppRouter.kHomeView);
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
