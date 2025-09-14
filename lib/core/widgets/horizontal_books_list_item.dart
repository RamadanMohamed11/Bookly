import 'package:bookly/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalBooksListItem extends StatelessWidget {
  const HorizontalBooksListItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 150,
        child: CustomNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}
