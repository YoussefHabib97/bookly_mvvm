import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      centerTitle: true,
      title: GestureDetector(
        onLongPress: () {
          SharedPrefs.clearPrefs();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Cleared Shared Preferences"),
            ),
          );
        },
        child: Image.asset(
          'assets/images/logo.png',
          color: Theme.of(context).colorScheme.primary,
          height: 32,
        ),
      ),
      actions: [
        IconButton(
          tooltip: 'Search',
          onPressed: () {
            AppRouter.router.push(AppRouter.kSearchView);
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
