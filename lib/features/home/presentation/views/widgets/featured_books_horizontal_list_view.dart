import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';

class FeaturedBooksHorizontalListView extends StatelessWidget {
  const FeaturedBooksHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) => BookCoverTile(
          onTap: () {
            AppRouter.router.push(AppRouter.kBookDetailsView);
          },
          isDecorationImg: true,
        ),
      ),
    );
  }
}
