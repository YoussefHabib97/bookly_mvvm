import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_action_buttons.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_rating_widget.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SelectedBookSection extends StatelessWidget {
  final BookModel? book;
  const SelectedBookSection({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.325,
          child: BookCoverTile(
            isDecorationImg: false,
            book: book,
          ),
        ),
        Text(
          book!.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        Text(
          book!.volumeInfo.authors![0],
          style: Styles.textStyle20,
        ),
        BookRatingWidget(
          book: book,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 16),
        BookActionButtons(
          book: book!,
        ),
      ],
    );
  }
}
