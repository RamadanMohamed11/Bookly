import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await ApiService().get(
        endPoint:
            'volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=bestselling',
      );
      List<BookModel> books =
          data['items'].map((e) => BookModel.fromJson(e)).toList();
      return Right(books);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await ApiService().get(
        endPoint:
            'volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=newest',
      );
      List<BookModel> books =
          data['items'].map((e) => BookModel.fromJson(e)).toList();
      return Right(books);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks() async {
    try {
      Map<String, dynamic> data = await ApiService().get(
        endPoint:
            'volumes?q=subject:Programming&Filtering=free-ebooks&Sorting=newest',
      );
      List<BookModel> books =
          data['items'].map((e) => BookModel.fromJson(e)).toList();
      return Right(books);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
