import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 350),
                  ),
                  SlideEffect(
                    begin: Offset.zero,
                    end: Offset(0, -5),
                    delay: Duration(seconds: 1, milliseconds: 500),
                    duration: Duration(milliseconds: 750),
                  ),
                ],
                child: Image.asset(
                  'assets/images/logo.png',
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
