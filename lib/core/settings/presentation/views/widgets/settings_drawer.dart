import 'package:bookly_mvvm/core/themes/presentation/widgets/theme_switcher_widget.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Theme Settings",
                  style: Styles.textStyle20,
                ),
                SizedBox(height: 16),
                ThemeSwitcherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
