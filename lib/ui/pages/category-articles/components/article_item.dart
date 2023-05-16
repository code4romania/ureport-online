import 'package:flutter/material.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart' as storyFull;
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';

import '../../../../utils/hex_colors_utils.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({
    Key? key,
    this.article,
    this.articleFull,
    this.width,
    required this.categoryName,
    required this.subCategoryName,
    required this.isExpanded,
  }) : super(key: key);

  final Story? article;
  final storyFull.StoryItem? articleFull;
  final String categoryName;
  final String subCategoryName;
  final bool isExpanded;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? 190;

    String imageUrl = "";
    String title = "";

    title = article?.title ?? articleFull?.title ?? "";

    if (articleFull != null) {
      if (articleFull?.images != null) {
        imageUrl = articleFull!.images!.first;
      }
    } else {
      if (article?.images != null) {
        imageUrl = article!.images!.first;
      }
    }

    return Container(
        width: widgetWidth,
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          bottom: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(8, 8),
                spreadRadius: 2,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: imageUrl.isNotEmpty
                  ? CachedImageComponent(
                      width: widgetWidth,
                      height: isExpanded ? 230 : 172,
                      // 4/3 aici
                      // 16/9 landscape

                      imageUrl: imageUrl,
                    )
                  : Image.asset(
                      "assets/images/image_placeholder.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Color.fromRGBO(155, 13, 132, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: widgetWidth - 80,
                    child: Text(
                      subCategoryName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: widgetWidth,
              margin: EdgeInsets.only(
                left: 15,
                top: 10,
                right: 5,
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 2 : 3,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 20,
              width: widgetWidth,
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Text(
                "CITEȘTE MAI MULT",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#A72D6F"),
                ),
              ),
            ),
          ],
        ));
  }
}
