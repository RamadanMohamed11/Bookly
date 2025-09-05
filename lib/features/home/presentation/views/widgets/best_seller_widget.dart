import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.bestSellerModel});
  final BestSellerModel bestSellerModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Image.asset(bestSellerModel.image, fit: BoxFit.fitHeight),
        ),
        SizedBox(width: 30),

        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bestSellerModel.bookTitle,
                style: Styles.gTsectraFineRegular20,
              ),
              SizedBox(width: 5),
              Text(bestSellerModel.author, style: Styles.montserratMedium14),
              SizedBox(width: 5),
              Row(
                children: [
                  Text(bestSellerModel.price, style: Styles.montserratBold20),
                  Spacer(),
                  Icon(Icons.star, color: Color(0xffFFDD4F)),
                  SizedBox(width: 4.2),
                  Text(
                    bestSellerModel.rating,
                    style: Styles.montserratMedium16,
                  ),
                  SizedBox(width: 7),

                  Text(
                    bestSellerModel.reviews,
                    style: Styles.montserratRegular14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
