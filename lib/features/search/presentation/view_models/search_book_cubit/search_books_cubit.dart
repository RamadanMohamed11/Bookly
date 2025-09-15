import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchRepo searchRepo;
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  // emit initial state again
  void emitInitial() => emit(SearchBooksInitial());

  Future<void> fetchSearchedBooks({required String searchQuery}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchedBooks(searchQuery: searchQuery);
    result.fold(
      (failure) => emit(SearchBooksInitial()),
      (books) => emit(SearchBooksSuccess(books)),
    );
  }
}
