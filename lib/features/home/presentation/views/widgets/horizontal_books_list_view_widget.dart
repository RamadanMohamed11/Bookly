import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
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
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: AssetsData.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetsData.books[index]),
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
