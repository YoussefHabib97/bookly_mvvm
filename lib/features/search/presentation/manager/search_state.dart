part of 'search_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchCubitLoading extends SearchCubitState {}

final class SearchCubitSuccess extends SearchCubitState {
  final List<BookModel> books;

  const SearchCubitSuccess(this.books);
}

final class SearchCubitFailure extends SearchCubitState {
  final String errMessage;

  const SearchCubitFailure(this.errMessage);
}
