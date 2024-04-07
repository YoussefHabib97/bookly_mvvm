import 'package:flutter/material.dart';

class BookCoverTile extends StatelessWidget {
  const BookCoverTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset('assets/images/test_image.png'),
    );
  }
}
