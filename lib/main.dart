import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/app_router.dart';
import 'core/utils/shared_preferences.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  Prefs.instance = await SharedPreferences.getInstance();
  bool isFirstRun = await IsFirstRun.isFirstRun();
  if (isFirstRun) {
    Prefs.instance!.setString(kAppThemeKey, kAppThemeDeviceDefault);
  } else {
    Prefs.instance!.getString(kAppThemeKey);
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

class ApplicationRoot extends StatefulWidget {
  const ApplicationRoot({super.key});

  @override
  State<ApplicationRoot> createState() => _ApplicationRootState();
}

class _ApplicationRootState extends State<ApplicationRoot> {
  DateTime timeBackpressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
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
            themeMode: Prefs.instance!.getString(kAppThemeKey) ==
                    kAppThemeDeviceDefault
                ? ThemeMode.system
                : Prefs.instance!.getString(kAppThemeKey) == kAppThemeLight
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
