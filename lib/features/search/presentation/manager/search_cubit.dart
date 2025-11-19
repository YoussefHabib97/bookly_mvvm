import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  final HomeRepo homeRepo;
  late String searchTerms;
  SearchCubit(this.homeRepo) : super(SearchCubitInitial());

  Future<void> searchForBooks({required String searchTerms}) async {
    emit(SearchCubitLoading());
    var result = await homeRepo.searchForBooks(searchTerms: searchTerms);

    result.fold(
      (failure) => emit(
        SearchCubitFailure(failure.errMessage),
      ),
      (books) => emit(
        SearchCubitSuccess(books),
      ),
    );
  }
}
