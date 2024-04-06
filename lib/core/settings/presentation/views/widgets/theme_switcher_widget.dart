import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_mvvm/core/themes/themes.dart';
import 'package:bookly_mvvm/core/themes/cubit/theme_cubit.dart';

class ThemeSwitcherWidget extends StatelessWidget {
  const ThemeSwitcherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return SegmentedButton<ThemeState>(
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
        );
      },
    );
  }
}
