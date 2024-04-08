import 'package:bookly_mvvm/core/book/presentation/views/book_details_view.dart';
import 'package:go_router/go_router.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:bookly_mvvm/features/home/presentation/views/home_view.dart';
import 'package:bookly_mvvm/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:bookly_mvvm/features/search/presentation/search_view.dart';
import 'package:bookly_mvvm/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kOnboardingView = '/onboardingView';
  static const String kSplashView = '/splashView';
  static const String kHomeView = '/homeView';
  static const String kSearchView = '/searchView';
  static const String kBookDetailsView = '/bookDetailsView';

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
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
