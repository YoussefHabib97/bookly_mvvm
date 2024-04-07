import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/settings_drawer.dart';
import 'widgets/featured_books_horizontal_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onLongPress: () => SharedPrefs.clearPrefs(),
          child: Image.asset(
            'assets/images/logo.png',
            color: Theme.of(context).colorScheme.primary,
            height: 48,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: const SettingsDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            FeaturedBooksHorizontalListView(),
          ],
        ),
      ),
    );
  }
}
