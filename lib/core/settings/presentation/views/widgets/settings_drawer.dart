import 'package:flutter/material.dart';

import 'theme_switcher_widget.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: Column(
            children: [
              Text("Theme Settings"),
              SizedBox(height: 16),
              ThemeSwitcherWidget(),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
