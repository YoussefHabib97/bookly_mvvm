import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  const CustomDivider({
    super.key,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
