import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,

      errorWidget:
          (context, url, error) =>
              Container(color: Colors.grey, width: 80, height: 110).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration: Duration(milliseconds: 450),
                ),
              ),
    );
  }
}
