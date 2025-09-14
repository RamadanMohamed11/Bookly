import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';

class PriceAndFreePreviewWidget extends StatelessWidget {
  const PriceAndFreePreviewWidget({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            child: Text(
              "Free",
              style: Styles.montserratBold16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: InkWell(
              onTap: () async {
                // launch book url
                if (await canLaunchUrl(
                  Uri.parse(bookModel.volumeInfo.previewLink ?? ''),
                )) {
                  await launchUrl(Uri.parse(bookModel.volumeInfo.previewLink!));
                } else {
                  throw 'Could not launch ${bookModel.volumeInfo.previewLink}';
                }
              },
              child: Text(
                "Preview",
                style: Styles.gilroyBold16,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
