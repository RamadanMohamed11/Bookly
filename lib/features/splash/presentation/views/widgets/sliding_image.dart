import '../../../../../core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({super.key, required this.imageSlidingAnimation});

  final Animation<Offset> imageSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: imageSlidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: imageSlidingAnimation,
          child: Image.asset(AssetsData.logo),
        );
      },
    );
  }
}
