import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:flutter/material.dart';

import 'widgets/book_details_body.dart';

class BookDetailsView extends StatefulWidget {
  final bool showSuggestions;
  final BookModel? book;
  const BookDetailsView({
    super.key,
    this.showSuggestions = true,
    this.book,
  });

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: check if book is in local favorites
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () async {},
            icon: Icon(Icons.favorite_border,
                color: Theme.of(context).colorScheme.inversePrimary),
            tooltip: 'Add to Favorites',
          ),
          IconButton(
            onPressed: () {
              AppRouter.router.pushReplacement(AppRouter.kHomeView);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: BookDetailsBody(
        book: widget.book!,
        // TODO: Implement condition to check if it's in favorites, show no suggestions
        showSuggestions: widget.showSuggestions,
      ),
    );
  }
}
