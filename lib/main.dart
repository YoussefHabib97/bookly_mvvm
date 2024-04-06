import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/themes/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/app_router.dart';
import 'core/utils/shared_preferences.dart';

Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     systemNavigationBarColor: Colors.black,
  //     statusBarColor: Colors.black,
  //   ),
  // );

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.prefInit();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
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
    return PopScope(
      canPop: true,
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
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
      ),
    );
  }
}
