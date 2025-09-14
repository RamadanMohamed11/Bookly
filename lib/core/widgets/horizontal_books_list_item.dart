import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_network_image.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HorizontalBooksListItem extends StatelessWidget {
  const HorizontalBooksListItem({
    super.key,
    this.bookModel,
    required this.imageUrl,
  });
  final BookModel? bookModel;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigate to book details view
        if (bookModel != null) {
          GoRouter.of(context).push(AppRouter.kBooksView, extra: bookModel);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 150,
          child: Hero(
            // make random tag if bookModel is null
            tag: bookModel?.id ?? UniqueKey().toString(),
            child: CustomNetworkImage(imageUrl: imageUrl),
          ),
        ),
      ),
    );
  }
}
