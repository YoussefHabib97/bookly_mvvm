import 'package:bookly_mvvm/features/home/presentation/views/widgets/latest_releases_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';

class LatestReleasesSection extends StatelessWidget {
  const LatestReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Latest Releases",
              style: Styles.textStyle18,
            ),
          ),
        ),
        LatestReleasesListView(),
      ],
    );
  }
}
