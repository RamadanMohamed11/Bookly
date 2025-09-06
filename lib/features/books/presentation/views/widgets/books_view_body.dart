import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/books/presentation/views/widgets/book_app_bar.dart';
import 'package:bookly/features/books/presentation/views/widgets/price_and_free_preview_widget.dart';
import 'package:bookly/features/books/presentation/views/widgets/rate_widget.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class BooksViewBody extends StatelessWidget {
  const BooksViewBody({super.key, required this.bestSellerModel});
  final BestSellerModel bestSellerModel;

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
                child: Image.asset(bestSellerModel.image),
              ),
            ),
          ),
          SizedBox(height: 45),
          Text(
            bestSellerModel.bookTitle,
            style: Styles.gTsectraFineRegular30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(bestSellerModel.author, style: Styles.montserratMedium18),
          SizedBox(height: 17),
          RateWidget(bestSellerModel: bestSellerModel),
          SizedBox(height: 52),
          PriceAndFreePreviewWidget(bestSellerModel: bestSellerModel),
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
