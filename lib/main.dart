import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/cubit/theme_cubit.dart';
import 'core/themes/themes.dart';
import 'core/utils/shared_preferences.dart';

import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatefulWidget {
  const ApplicationRoot({super.key});

  @override
  State<ApplicationRoot> createState() => _ApplicationRootState();
}

class _ApplicationRootState extends State<ApplicationRoot> {
  Set<String> selected = {'${sharedPreferences!.getString('defaultTheme')}'};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bookly',
            theme:
                state is LightThemeState ? ThemeData.light() : ThemeData.dark(),
            themeMode:
                state is LightThemeState ? ThemeMode.light : ThemeMode.dark,
            home: Scaffold(
              appBar: AppBar(
                actions: [
                  SegmentedButton(
                    showSelectedIcon: false,
                    selected: selected,
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(
                        () {
                          selected = newSelection;
                          if (selected.first == 'light') {
                            BlocProvider.of<AppThemeCubit>(context)
                                .changeTheme(ThemeState.light);
                            sharedPreferences!
                                .setString('defaultTheme', 'light');
                          } else {
                            BlocProvider.of<AppThemeCubit>(context)
                                .changeTheme(ThemeState.dark);
                            sharedPreferences!
                                .setString('defaultTheme', 'dark');
                          }
                        },
                      );
                    },
                    segments: const [
                      ButtonSegment(
                        enabled: true,
                        value: 'light',
                        label: Icon(Icons.light_mode),
                      ),
                      ButtonSegment(
                        enabled: true,
                        value: 'dark',
                        label: Icon(Icons.dark_mode),
                      ),
                    ],
                  ),
                ],
              ),
              body: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}
