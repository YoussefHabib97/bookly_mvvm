import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'sections/selected_book_section.dart';
import 'sections/suggested_books_section.dart';

class BookDetailsView extends StatelessWidget {
  final bool showSuggestions;
  const BookDetailsView({
    super.key,
    this.showSuggestions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.replace(AppRouter.kHomeView);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement adding favorites to local storage other than shared prefs
            },
            icon: Icon(Icons.favorite_border,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: showSuggestions
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectedBookSection(),
                  SuggestedBooksSection(),
                ],
              )
            : const SelectedBookSection(),
      ),
    );
  }
}
