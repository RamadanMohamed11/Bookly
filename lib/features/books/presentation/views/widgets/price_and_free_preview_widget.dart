import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class PriceAndFreePreviewWidget extends StatelessWidget {
  const PriceAndFreePreviewWidget({super.key, required this.bestSellerModel});

  final BestSellerModel bestSellerModel;

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
              bestSellerModel.price,
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
            child: Text(
              "Free preview",
              style: Styles.gilroyBold16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
