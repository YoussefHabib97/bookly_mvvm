import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/shared_preferences.dart';
import 'core/settings/presentation/views/widgets/theme_switcher.dart';

import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: flexSchemeLight,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: flexSchemeDark,
            useMaterial3: true,
          ),
          themeMode: state is DeviceDefaultThemeState ||
                  sharedPreferences!.getString(kAppThemeKey) ==
                      kAppThemeDeviceDefault
              ? ThemeMode.system
              : state is LightThemeState ||
                      sharedPreferences!.getString(kAppThemeKey) ==
                          kAppThemeLight
                  ? ThemeMode.light
                  : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          title: 'Bookly',
          home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const ThemeSwitcher(),
            ),
            body: const SplashView(),
          ),
        );
      },
    );
  }
}
