import 'package:flutter/material.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/book_details_list_tile.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const Divider(height: 16),
      itemBuilder: (context, index) => const BookDetailsListTile(),
    );
  }
}
