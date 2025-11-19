import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_details_list_tile.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchCubitState>(
      builder: (context, state) {
        switch (state) {
          case SearchCubitSuccess():
            return ListView.separated(
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const Divider(height: 16),
              itemBuilder: (context, index) => InkWell(
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
            );
          case SearchCubitFailure():
            return Center(
              child: Text((state).errMessage),
            );
          case SearchCubitLoading():
            return Skeletonizer(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(height: 16),
                itemBuilder: (context, index) => const InkWell(
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
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
