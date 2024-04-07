import 'package:flutter/material.dart';

import 'book_cover_tile.dart';

class FeaturedBooksHorizontalListView extends StatelessWidget {
  const FeaturedBooksHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(width: 4),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: BookCoverTile(),
        ),
      ),
    );
  }
}
