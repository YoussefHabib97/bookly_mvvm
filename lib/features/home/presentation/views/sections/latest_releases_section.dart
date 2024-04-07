import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/book_details_list_tile.dart';
import 'package:flutter/material.dart';

SliverList buildLatestReleasesListView() {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      childCount: 10,
      (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: BookDetailsListTile(),
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
