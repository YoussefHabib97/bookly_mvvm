import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/app_router.dart';
import 'core/themes/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  bool isFirstRun = await IsFirstRun.isFirstRun();
  if (isFirstRun) {
    prefs!.setString(kAppThemeKey, kAppThemeDeviceDefault);
  }
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
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData(
            colorScheme: flexSchemeLight,
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: flexSchemeDark,
            useMaterial3: true,
          ),
          themeMode: prefs!.getString(kAppThemeKey) == kAppThemeDeviceDefault
              ? ThemeMode.system
              : prefs!.getString(kAppThemeKey) == kAppThemeLight
                  ? ThemeMode.light
                  : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'Bookly',
        );
      },
    );
  }
}
