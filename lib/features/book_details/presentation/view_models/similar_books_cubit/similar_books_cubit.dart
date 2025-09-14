import 'package:bloc/bloc.dart';
import 'package:bookly/features/book_details/data/repo/book_details_repo.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final BookDetailsRepo bookDetailsRepo;
  SimilarBooksCubit(this.bookDetailsRepo) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await bookDetailsRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errorMessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
