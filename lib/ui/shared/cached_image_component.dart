import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ureport_ecaro/utils/constants.dart';

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
    return imageUrl.isEmpty || imageUrl == null
        ? Image.asset("assets/images/image_placeholder.jpg")
        : CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
              valueColor: AlwaysStoppedAnimation<Color>(blueColor),
            ),
            placeholder: (context, url) => Image.asset(
              "assets/images/image_placeholder.jpg",
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/image_placeholder.jpg",
              fit: BoxFit.cover,
            ),
            fit: BoxFit.cover,
          );
  }
}
