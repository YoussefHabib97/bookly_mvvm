import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';

class BookRatingWidget extends StatelessWidget {
  const BookRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.amberAccent,
          size: 24,
        ),
        Text('5.0', style: Styles.textStyle16),
        SizedBox(width: 4),
        Opacity(
          opacity: 0.75,
          child: Text(
            '(2380)',
          ),
        )
      ],
    );
  }
}
