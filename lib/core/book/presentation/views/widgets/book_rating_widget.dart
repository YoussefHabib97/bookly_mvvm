import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRatingWidget extends StatelessWidget {
  final BookModel? book;
  final MainAxisAlignment mainAxisAlignment;
  const BookRatingWidget({
    super.key,
    required this.book,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: book?.volumeInfo.averageRating == null
          ? [
              const Text('Unrated', style: Styles.textStyle16),
            ]
          : [
              Text(book!.volumeInfo.averageRating.toString(),
                  style: Styles.textStyle16),
              const Icon(
                Icons.star_rounded,
                color: Colors.amberAccent,
                size: 24,
              ),
              const SizedBox(width: 4),
              Opacity(
                opacity: 0.75,
                child: Text(
                  '(${book!.volumeInfo.averageRating.toString()})',
                ),
              )
            ],
    );
  }
}
