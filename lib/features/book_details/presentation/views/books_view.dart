import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/book_details/data/repo/book_details_repo.dart';
import 'package:bookly/features/book_details/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/books_view_body.dart';
import '../../../../core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    // use bloc provider to provide the cubit to the widget tree and fetch similar books
    return Scaffold(
      body: BlocProvider(
        create:
            (context) => SimilarBooksCubit(
              getIt.get<BookDetailsRepo>(),
            )..fetchSimilarBooks(category: bookModel.volumeInfo.categories![0]),
        child: BooksViewBody(bookModel: bookModel),
      ),
    );
  }
}
