import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/latest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes/data/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_preferences.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/views/manager/cubit/featured_books_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await SharedPrefs.prefsInit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              LatestBooksCubit(getIt.get<HomeRepoImpl>())..getLatestBooks(),
        ),
      ],
      child: const ApplicationRoot(),
    ),
  );
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: const Color(0xff006a60),
            ),
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: const Color(0xff53dbca),
            ),
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          themeMode: state is DeviceDefaultThemeState ||
                  SharedPrefs.getData(key: kAppThemeKey) ==
                      kAppThemeDeviceDefault
              ? ThemeMode.system
              : state is LightThemeState ||
                      SharedPrefs.getData(key: kAppThemeKey) == kAppThemeLight
                  ? ThemeMode.light
                  : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'Bookly',
        );
      },
    );
  }
}
