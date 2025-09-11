import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Either<Failure, List<BookModel>> fetchFeaturedBooks();
  Either<Failure, List<BookModel>> fetchNewestBooks();
  Either<Failure, List<BookModel>> fetchSimilarBooks();
}
