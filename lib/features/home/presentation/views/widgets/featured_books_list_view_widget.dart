import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/horizontal_books_list_item.dart';
import '../../view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewWidget extends StatelessWidget {
  const FeaturedBooksListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess || state is FeaturedBooksLoading) {
          return SizedBox(
            height: 205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount:
                  state is FeaturedBooksSuccess ? state.books.length : 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right:
                        state is FeaturedBooksSuccess
                            ? (state.books[index] != state.books.last ? 15 : 0)
                            : (index != 9 ? 15 : 0),
                  ),
                  child: HorizontalBooksListItem(
                    imageUrl:
                        state is FeaturedBooksSuccess
                            ? state.books[index].volumeInfo.imageLinks.thumbnail
                            : "",
                    bookModel:
                        state is FeaturedBooksSuccess
                            ? state.books[index]
                            : null,
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorWidget(errorMessage: state.errMessage),
          );
        } else {
          return const Center(
            child: Center(child: CustomCircularProgressIndicator()),
          );
        }
      },
    );
  }
}
