import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_details_list_tile.dart';
import 'package:bookly_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/featured_books_cubit.dart';

class LatestReleasesListView extends StatelessWidget {
  const LatestReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        switch (state) {
          case FeaturedBooksSuccess():
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.books.length,
                (context, index) => InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  onTap: () {
                    AppRouter.router
                        .pushReplacement(AppRouter.kBookDetailsView);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BookDetailsListTile(
                      book: state.books[index],
                    ),
                  ),
                ),
              ),
            );

          case FeaturedBooksFailure():
            return SliverToBoxAdapter(
                child: CustomErrorWidget(errMessage: state.errMessage));
          default:
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()));
        }
      },
    );
  }
}
