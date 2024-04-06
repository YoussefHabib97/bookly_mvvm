import 'package:bookly_mvvm/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_mvvm/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kOnboardingView = '/onboardingView';
  static const String kSplashView = '/splashView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
    ],
  );
}
