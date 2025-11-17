import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_details_list_tile.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/latest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LatestReleasesListView extends StatelessWidget {
  const LatestReleasesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestBooksCubit, LatestBooksState>(
      builder: (context, state) {
        switch (state) {
          case LatestBooksSuccess():
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.books.length,
                (context, index) => InkWell(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  onTap: () async {
                    await AppRouter.router.push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
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

          case LatestBooksFailure():
            return SliverToBoxAdapter(
                child: CustomErrorWidget(errMessage: state.errMessage));
          default:
            return SliverSkeletonizer(
              child: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 5,
                  (context, index) => const InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    onTap: null,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BookDetailsListTile(
                        book: null,
                      ),
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
