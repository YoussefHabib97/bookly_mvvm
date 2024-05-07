import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'widgets/book_details_body.dart';

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
      body: BookDetailsBody(
        showSuggestions: showSuggestions,
      ),
    );
  }
}
