import 'package:flutter/material.dart';
import 'book_rating_widget.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';

class BookDetailsListTile extends StatelessWidget {
  const BookDetailsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 150,
          child: BookCoverTile(
            isDecorationImg: false,
            book: null,
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Diamond Dust',
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'Ahmed Mourad',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Free',
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const BookRatingWidget(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
