import 'package:bookly_mvvm/core/themes/data/cubit/theme_cubit.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) => SegmentedButton<ThemeState>(
          selected: BlocProvider.of<AppThemeCubit>(context).getThemeState(),
          showSelectedIcon: false,
          onSelectionChanged: (Set<ThemeState> newThemeState) {
            switch (newThemeState.first) {
              case ThemeState.light:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.light);
              case ThemeState.dark:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.dark);
              default:
                BlocProvider.of<AppThemeCubit>(context)
                    .setTheme(ThemeState.deviceDefault);
            }
          },
          segments: const [
            ButtonSegment(
              enabled: true,
              tooltip: 'Light Theme',
              icon: Icon(Icons.light_mode_rounded),
              value: ThemeState.light,
            ),
            ButtonSegment(
              tooltip: 'System Default',
              icon: Icon(Icons.phone_android_rounded),
              value: ThemeState.deviceDefault,
            ),
            ButtonSegment(
              tooltip: 'Dark Theme',
              icon: Icon(Icons.dark_mode_rounded),
              value: ThemeState.dark,
            ),
          ],
        ),
      );
}
