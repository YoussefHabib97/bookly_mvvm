import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'latest_books_state.dart';

class LatestBooksCubit extends Cubit<LatestBooksState> {
  final HomeRepo homeRepo;

  LatestBooksCubit(this.homeRepo) : super(LatestBooksInitial());

  Future<void> getLatestBooks() async {
    emit(LatestBooksLoading());
    var result = await homeRepo.fetchLatestBooks();

    result.fold(
      (failure) => emit(
        LatestBooksFailure(failure.errMessage),
      ),
      (books) => emit(
        LatestBooksSuccess(books),
      ),
    );
  }
}
