import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookAppBar extends StatelessWidget {
  const BookAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // using router to navigate
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.close, size: 23),
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
