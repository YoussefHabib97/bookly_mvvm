import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/widgets/custom_divider.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/featured_books_horizontal_list_view.dart';

class FeaturedBooksSection extends StatelessWidget {
  const FeaturedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: FeaturedBooksHorizontalListView(
                onTap: () {
                  AppRouter.router.push(AppRouter.kBookDetailsView);
                },
              ),
            ),
            const CustomDivider(thickness: 0.5)
          ],
        ),
      ),
    );
  }
}
