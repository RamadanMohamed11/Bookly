import 'package:bookly/features/search/presentation/view_models/search_book_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<SearchBooksCubit>(
            context,
          ).fetchSearchedBooks(searchQuery: value);
        }
        if (value.isEmpty) {
          BlocProvider.of<SearchBooksCubit>(context).emitInitial();
        }
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}
