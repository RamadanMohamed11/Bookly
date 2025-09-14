import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../view_models/best_seller_model.dart';
import '../../view_models/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

class BestSellerSliverList extends StatelessWidget {
  const BestSellerSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess || state is NewestBooksLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                    left: 30,
                    right: 30,
                  ),
                  child: BestSellerWidget(
                    bookModel:
                        state is NewestBooksSuccess
                            ? state.booksList[index]
                            : null,
                  ).redacted(
                    context: context,
                    redact: state is NewestBooksLoading,
                    configuration: RedactedConfiguration(
                      animationDuration: Duration(milliseconds: 500),
                    ),
                  ),
                );
              },
              childCount:
                  state is NewestBooksSuccess ? state.booksList.length : 10,
            ),
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
