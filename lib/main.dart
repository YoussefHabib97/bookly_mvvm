import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/cubit/theme_cubit.dart';
import 'core/utils/shared_preferences.dart';

import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const ApplicationRoot());
}

class ApplicationRoot extends StatelessWidget {
  const ApplicationRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppThemeCubit()..changeTheme(ThemeState.deviceDefault),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is LightThemeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bookly',
              theme: ThemeData.light(),
              home: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppThemeCubit>(context)
                            .changeTheme(ThemeState.dark);
                      },
                      icon: const Icon(Icons.account_circle_sharp),
                    ),
                  ],
                ),
                body: const SplashView(),
              ),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bookly',
              theme: ThemeData.dark(),
              home: Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppThemeCubit>(context)
                            .changeTheme(ThemeState.light);
                      },
                      icon: const Icon(Icons.account_circle_sharp),
                    ),
                  ],
                ),
                body: const SplashView(),
              ),
            );
          }
        },
      ),
    );
  }
}
