import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/widgets/custom_filled_button.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomFilledButton(
          buttonText: '\$19.99',
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          onPressed: () {},
        ),
        CustomFilledButton(
          buttonText: 'Free Preview',
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {},
        ),
      ],
    );
  }
}
