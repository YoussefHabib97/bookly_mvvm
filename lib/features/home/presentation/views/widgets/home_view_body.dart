import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/featured_books_cubit.dart';
import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/latest_books_cubit.dart';
import 'package:bookly_mvvm/features/home/presentation/views/sections/featured_books_section.dart';
import 'package:bookly_mvvm/features/home/presentation/views/sections/latest_releases_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'floating_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.wait(
          [
            Future(
              () {
                return BlocProvider.of<FeaturedBooksCubit>(context)
                    .getFeaturedBooks();
              },
            ),
            Future(
              () {
                return BlocProvider.of<LatestBooksCubit>(context)
                    .getLatestBooks();
              },
            ),
          ],
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Theme.of(context).brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: const CustomScrollView(
          slivers: [
            FloatingAppBar(),
            FeaturedBooksSection(),
            LatestReleasesSection(),
          ],
        ),
      ),
    );
  }
}
