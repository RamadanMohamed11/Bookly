import 'package:bookly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:bookly/features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSliverList extends StatelessWidget {
  const BestSellerSliverList({super.key, required this.bestSellerModels});

  final List<BestSellerModel> bestSellerModels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: BestSellerWidget(bookModel: state.booksList[index]),
              );
            }, childCount: state.booksList.length),
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: CustomErrorWidget(errorMessage: (state.errorMessage)),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CustomCircularProgressIndicator()),
          );
        }
      },
    );
  }
}
