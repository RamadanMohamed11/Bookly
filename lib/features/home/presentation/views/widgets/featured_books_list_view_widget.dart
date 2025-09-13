import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewWidget extends StatelessWidget {
  const FeaturedBooksListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: state.books[index] != state.books.last ? 15 : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      width: 150,
                      // child: Image.network(
                      //   state.books[index].volumeInfo.imageLinks.thumbnail,
                      //   fit: BoxFit.fitHeight,
                      // ),
                      child: CachedNetworkImage(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks.thumbnail,
                        fit: BoxFit.fill,

                        errorWidget:
                            (context, url, error) => Image.asset(
                              AssetsData.defaultBook,
                              fit: BoxFit.fill,
                            ),
                      ),
                    ),
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
