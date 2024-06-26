import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_cover_tile.dart';
import 'package:bookly_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/featured_books_cubit.dart';

class FeaturedBooksHorizontalListView extends StatelessWidget {
  final void Function()? onTap;
  const FeaturedBooksHorizontalListView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        switch (state) {
          case FeaturedBooksSuccess():
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return BookCoverTile(
                    onTap: onTap,
                    isDecorationImg: true,
                    book: state.books[index],
                  );
                },
              ),
            );
          case FeaturedBooksFailure():
            return CustomErrorWidget(errMessage: state.errMessage);
          default:
            return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    );
  }
}
