import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/book_details/data/repo/book_details_repo.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookDetailsRepoImpl implements BookDetailsRepo {
  final ApiService apiService;
  BookDetailsRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      Map<String, dynamic> data = await apiService.get(
        endPoint: 'volumes?q=$category&Filtering=free-ebooks&Sorting=relevance',
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
        // removing the "Exception:" from e.toString()
        return Left(ServerFailure(e.toString().split(':').last));
      }
    }
  }
}
