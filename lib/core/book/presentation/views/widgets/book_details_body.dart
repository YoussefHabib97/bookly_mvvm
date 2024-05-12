import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/book/presentation/views/sections/selected_book_section.dart';
import 'package:bookly_mvvm/core/book/presentation/views/sections/suggested_books_section.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({
    super.key,
    required this.showSuggestions,
  });

  final bool showSuggestions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: showSuggestions
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectedBookSection(
                  book: null,
                ),
                SuggestedBooksSection(),
              ],
            )
          : const SelectedBookSection(
              book: null,
            ),
    );
  }
}
