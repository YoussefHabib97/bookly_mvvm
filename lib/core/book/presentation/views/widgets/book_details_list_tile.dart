import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'book_rating_widget.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';

class BookDetailsListTile extends StatelessWidget {
  final BookModel? book;
  const BookDetailsListTile({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 150,
          child: BookCoverTile(
            isDecorationImg: false,
            book: book,
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
                  book!.volumeInfo.title!,
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                book!.volumeInfo.authors![0],
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    book!.saleInfo!.retailPrice == null
                        ? "Free"
                        : book!.saleInfo!.retailPrice.toString(),
                    style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BookRatingWidget(
                    book: book!,
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
