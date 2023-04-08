import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';

class CachedImageComponent extends StatelessWidget {
  const CachedImageComponent({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.blockedImage,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final bool? blockedImage;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? Image.asset("assets/images/image_placeholder.jpg")
        : CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            color: blockedImage != null ? Colors.grey : null,
            colorBlendMode: blockedImage != null ? BlendMode.color : null,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: LoadingIndicatorComponent(),
            ),
            errorWidget: (context, url, error) => Image.asset(
              "assets/images/image_placeholder.jpg",
            ),
          );
  }
}
