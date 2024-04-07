import 'package:flutter/material.dart';
import 'widgets/home_view_body.dart';
import 'package:bookly_mvvm/core/settings/presentation/views/widgets/settings_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SettingsDrawer(),
      body: HomeViewBody(),
    );
  }
}
