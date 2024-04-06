import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/settings_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SettingsDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              color: Theme.of(context).colorScheme.primary,
              height: 48,
            ),
            actions: [
              IconButton(
                tooltip: 'Search',
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
