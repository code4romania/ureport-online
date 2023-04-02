import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageComponent extends StatelessWidget {
  const CachedImageComponent({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? Image.asset("assets/images/image_placeholder.jpg")
        : Image.network(imageUrl, height: height, width: width,
            loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }, errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/images/image_placeholder.jpg");
          });
  }
}
