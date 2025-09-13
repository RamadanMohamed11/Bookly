import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/books/presentation/views/widgets/book_app_bar.dart';
import 'package:bookly/features/books/presentation/views/widgets/price_and_free_preview_widget.dart';
import 'package:bookly/features/books/presentation/views/widgets/rate_widget.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BookAppBar(),
          SizedBox(height: 33.2),
          SizedBox(
            width: 162,
            child: AspectRatio(
              aspectRatio: 162 / 243,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  bookModel.volumeInfo.imageLinks.thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 45),
          Text(
            bookModel.volumeInfo.title,
            style: Styles.gTsectraFineRegular30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            bookModel.volumeInfo.authors[0],
            style: Styles.montserratMedium18,
          ),
          SizedBox(height: 17),
          RateWidget(
            rate: bookModel.volumeInfo.averageRating ?? 0,
            reviews: bookModel.volumeInfo.ratingsCount ?? 0,
          ),
          SizedBox(height: 52),
          PriceAndFreePreviewWidget(),
          SizedBox(height: 51),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              "You can also like",
              style: Styles.montserratSemiBold14,
            ),
          ),
        ],
      ),
    );
  }
}
