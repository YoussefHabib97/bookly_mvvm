import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';

class BookRatingWidget extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRatingWidget({
    super.key,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Text('5.0', style: Styles.textStyle16),
        Icon(
          Icons.star_rounded,
          color: Colors.amberAccent,
          size: 24,
        ),
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
