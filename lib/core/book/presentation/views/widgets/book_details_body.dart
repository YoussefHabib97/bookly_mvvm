import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/book/presentation/views/sections/selected_book_section.dart';
import 'package:bookly_mvvm/core/book/presentation/views/sections/suggested_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
    required this.showSuggestions,
    required this.book,
  });

  final BookModel book;
  final bool showSuggestions;

  @override
  Widget build(BuildContext context) {
    return showSuggestions
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectedBookSection(
                  book: book,
                ),
                const SuggestedBooksSection(),
              ],
            ),
          )
        : Center(
            child: SelectedBookSection(
              book: book,
            ),
          );
  }
}
