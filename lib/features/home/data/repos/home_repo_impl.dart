import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import '../../../../core/models/book_model/book_model.dart';
import 'home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?q=Embedded%20System&Filtering=free-ebooks&Sorting=bestselling',
      );
      List<BookModel> books = [];
      for (var e in data['items']) {
        books.add(BookModel.fromJson(e));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint:
            'volumes?q=Computer Science&Filtering=free-ebooks&Sorting=newest',
      );
      List<BookModel> books = [];
      for (var e in data['items']) {
        books.add(BookModel.fromJson(e));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
