import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/core/book/presentation/views/widgets/book_details_list_tile.dart';

SliverList buildLatestReleasesListView() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: 10,
      (context, index) => InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          AppRouter.router.push(AppRouter.kBookDetailsView);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: BookDetailsListTile(),
        ),
      ),
    ),
  );
}

SliverToBoxAdapter buildLatestReleasesText() {
  return const SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "Latest Releases",
        style: Styles.textStyle18,
      ),
    ),
  );
}
