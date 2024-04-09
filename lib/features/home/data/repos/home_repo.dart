import 'package:dartz/dartz.dart';
import 'package:bookly_mvvm/core/utils/api_service.dart';
import 'package:bookly_mvvm/core/book/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchLatestBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
