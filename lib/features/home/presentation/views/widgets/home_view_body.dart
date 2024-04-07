import 'package:flutter/material.dart';
import 'book_details_list_tile.dart';
import 'featured_books_horizontal_list_view.dart';
import 'package:bookly_mvvm/core/utils/shared_preferences.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(
          const Duration(seconds: 3),
        );
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            title: GestureDetector(
              onLongPress: () => SharedPrefs.clearPrefs(),
              child: Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).colorScheme.primary,
                height: 32,
              ),
            ),
            actions: [
              IconButton(
                tooltip: 'Search',
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: const FeaturedBooksHorizontalListView(),
                  ),
                  const Divider(
                    height: 32,
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Latest Releases",
                style: Styles.textStyle18,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: BookDetailsListTile(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
