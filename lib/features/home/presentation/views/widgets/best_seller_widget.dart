import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBooksView, extra: bookModel);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 110,
              width: 80,
              // child: Image.network(
              //   bookModel.volumeInfo.imageLinks.thumbnail,
              //   fit: BoxFit.fitHeight,
              // ),
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                fit: BoxFit.fitHeight,
                errorWidget:
                    (context, url, error) =>
                        Image.asset(AssetsData.defaultBook, fit: BoxFit.fill),
              ),
            ),
          ),
          SizedBox(width: 30),

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookModel.volumeInfo.title,
                  style: Styles.gTsectraFineRegular20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(width: 5),
                Text(
                  bookModel.volumeInfo.authors[0],
                  style: Styles.montserratMedium14,
                ),
                SizedBox(width: 5),
                Row(
                  children: [
                    Text("Free", style: Styles.montserratBold20),
                    Spacer(),
                    Icon(Icons.star, color: Color(0xffFFDD4F)),
                    SizedBox(width: 4.2),
                    Text(
                      bookModel.volumeInfo.averageRating?.toString() ?? "0",
                      style: Styles.montserratMedium16,
                    ),
                    SizedBox(width: 7),

                    Text(
                      "(${bookModel.volumeInfo.ratingsCount?.toString() ?? "0"})",
                      style: Styles.montserratRegular14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
