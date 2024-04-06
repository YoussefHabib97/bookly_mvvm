import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:bookly_mvvm/features/home/presentation/views/home_view.dart';
import 'package:bookly_mvvm/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_mvvm/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kOnboardingView = '/onboardingView';
  static const String kSplashView = '/splashView';
  static const String kHomeView = '/homeView';

  static var router = GoRouter(
    routes: [
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => SharedPrefs.isAppFirstRun
            ? const OnboardingView()
            : const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: CurveTween(curve: Curves.easeOut).animate(animation),
            child: child,
          ),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
