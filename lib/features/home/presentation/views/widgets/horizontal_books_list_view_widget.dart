import 'package:bookly/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class HorizontalBooksListViewWidget extends StatelessWidget {
  const HorizontalBooksListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AssetsData.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsData.books[index]),
          );
        },
      ),
    );
  }
}
