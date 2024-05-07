import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_action_buttons.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_rating_widget.dart';

class SelectedBookSection extends StatelessWidget {
  const SelectedBookSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.325,
          child: const BookCoverTile(
            isDecorationImg: false,
            book: null,
          ),
        ),
        const Text(
          "Diamond Dust",
          style: Styles.textStyle30,
        ),
        const Text(
          "Ahmed Mourad",
          style: Styles.textStyle20,
        ),
        const BookRatingWidget(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 16),
        const BookActionButtons(),
      ],
    );
  }
}
