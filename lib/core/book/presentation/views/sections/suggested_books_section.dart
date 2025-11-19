import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/books_horizontal_list_view.dart';
import 'package:flutter/material.dart';

class SuggestedBooksSection extends StatelessWidget {
  final BookModel book;
  const SuggestedBooksSection({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return book.volumeInfo.categories?.first != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "You may also like",
                    style: Styles.textStyle18,
                  ),
                ),
                BooksHorizontalListView(
                  category: book.volumeInfo.categories?.first,
                  isDisplayFeatured: false,
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
