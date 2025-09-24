import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_widget.dart';
import 'package:bookly/features/search/presentation/view_models/search_book_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess || state is SearchBooksLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search Results",
                style: Styles.montserratBold20.copyWith(fontSize: 18),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount:
                      state is SearchBooksSuccess ? state.books.length : 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: BestSellerWidget(
                        bookModel:
                            state is SearchBooksSuccess
                                ? state.books[index]
                                : null,
                      ).redacted(
                        context: context,
                        redact: state is SearchBooksLoading,
                        configuration: RedactedConfiguration(
                          animationDuration: Duration(milliseconds: 500),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchBooksLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Image.asset(AssetsData.search, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Search for a book',
                  style: Styles.montserratRegular14.copyWith(fontSize: 24),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
