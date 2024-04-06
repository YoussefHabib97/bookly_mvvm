import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Home View"),
              FilledButton(
                onPressed: () {
                  CacheData.clearPrefs();
                },
                child: const Text("Clear Shared Preferences"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
