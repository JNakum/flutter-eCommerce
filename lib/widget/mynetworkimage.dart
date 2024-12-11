import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? imgHeight, imgWidth;
  final BoxFit fit;

  const MyNetworkImage({
    super.key,
    required this.imageUrl,
    this.imgHeight,
    this.imgWidth,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
      height: imgHeight,
      width: imgWidth,
      fit: fit,
    );
  }
}
