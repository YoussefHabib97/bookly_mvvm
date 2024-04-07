import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2, milliseconds: 250),
      () => AppRouter.router.go(AppRouter.kHomeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/logo.png',
        color: Theme.of(context).colorScheme.primary,
      )),
    );
  }
}
