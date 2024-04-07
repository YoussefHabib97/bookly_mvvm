import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/settings_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onLongPress: () {
            SharedPrefs.clearPrefs();
          },
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
