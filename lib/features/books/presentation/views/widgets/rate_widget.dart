import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Color(0xffFFDD4F)),
        Text("rate", style: Styles.montserratMedium16),
        SizedBox(width: 7),
        Text("reviews", style: Styles.montserratRegular14),
      ],
    );
  }
}
