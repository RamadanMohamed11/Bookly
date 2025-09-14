import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate, required this.reviews});
  final num rate;
  final int reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Color(0xffFFDD4F)),
        Text(rate.toString(), style: Styles.montserratMedium16),
        SizedBox(width: 7),
        Text("(${reviews.toString()})", style: Styles.montserratRegular14),
      ],
    );
  }
}
