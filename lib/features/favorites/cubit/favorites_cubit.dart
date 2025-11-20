import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  addBookToFavorites(BookModel book) async {
    emit(FavoritesLoading());
    try {
      Box<BookModel> favoritesBox = Hive.box('favoritesBox');
      await favoritesBox.add(book);
      emit(FavoritesSuccess());
      print(favoritesBox);
    } catch (e) {}
  }
}
