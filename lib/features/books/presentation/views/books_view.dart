import 'package:bookly/features/books/presentation/views/widgets/books_view_body.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class BooksView extends StatelessWidget {
  const BooksView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BooksViewBody(bookModel: bookModel));
  }
}
