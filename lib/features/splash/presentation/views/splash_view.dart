import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Animate(
            child: Image.asset(
              'assets/images/logo.png',
              color: Theme.of(context).colorScheme.primary,
            ),
          )
              .fadeIn(
                delay: const Duration(milliseconds: 250),
                duration: const Duration(milliseconds: 500),
              )
              .then(
                delay: const Duration(milliseconds: 750),
              )
              .fadeOut(
                duration: const Duration(milliseconds: 500),
              ),
        ),
      ),
    );
  }
}
