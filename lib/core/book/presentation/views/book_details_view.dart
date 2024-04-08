import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_rating_widget.dart';
import 'package:bookly_mvvm/core/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/core/widgets/custom_filled_button.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/featured_books_horizontal_list_view.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';

// TODO: Refactor to smaller widgets

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.pop();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.325,
                    child: const BookCoverTile(
                      isDecorationImg: false,
                    ),
                  ),
                  const Text(
                    "Diamond Blood",
                    style: Styles.textStyle30,
                  ),
                  const Text(
                    "Ahmed Mourad",
                    style: Styles.textStyle20,
                  ),
                  const BookRatingWidget(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomFilledButton(
                        buttonText: '\$19.99',
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.inverseSurface,
                        onPressed: () {},
                      ),
                      CustomFilledButton(
                        buttonText: 'Free Preview',
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomDivider(
                thickness: 0.25,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You may also like",
                    style: Styles.textStyle18,
                  ),
                  // TODO: Implement a checker to avoid having endless poppable pages
                  FeaturedBooksHorizontalListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
