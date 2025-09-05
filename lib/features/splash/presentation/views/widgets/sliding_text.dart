import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.textSlidingAnimation});

  final Animation<Offset> textSlidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textSlidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: textSlidingAnimation,
          child: Text(
            "Read free books",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
