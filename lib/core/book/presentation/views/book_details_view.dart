import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/features/home/presentation/views/manager/cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_body.dart';

class BookDetailsView extends StatefulWidget {
  final bool showSuggestions;
  final BookModel? book;
  const BookDetailsView({
    super.key,
    this.showSuggestions = true,
    this.book,
  });

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<FeaturedBooksCubit>(context).getFeaturedBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            AppRouter.router.pop();
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement adding favorites to local storage other than shared prefs
            },
            icon: Icon(Icons.favorite_border,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ],
      ),
      body: BookDetailsBody(
        book: widget.book!,
        showSuggestions: widget.showSuggestions,
      ),
    );
  }
}
