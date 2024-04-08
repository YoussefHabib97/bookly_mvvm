import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/featured_books_horizontal_list_view.dart';

class SuggestedBooksSection extends StatelessWidget {
  const SuggestedBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          FeaturedBooksHorizontalListView(
            onTap: () {
              AppRouter.router.replace(AppRouter.kBookDetailsView);
            },
          ),
        ],
      ),
    );
  }
}
