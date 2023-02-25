import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart' as storyFull;
import '../../../../utils/hex_colors_utils.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({
    Key? key,
    this.article,
    this.articleFull,
    this.width,
    required this.categoryName,
  }) : super(key: key);

  final Story? article;
  final storyFull.StoryItem? articleFull;
  final String categoryName;
  final double? width;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? 190;

    String imageUrl = "";
    String title = "";

    title = article?.title ?? articleFull?.title ?? "";
    if (articleFull != null) {
      if (article?.images != null) {
        imageUrl = article!.images!.first;
      }
    } else {
      if (articleFull?.images != null) {
        imageUrl = articleFull!.images!.first;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                  width: widgetWidth,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)),
                  ),
                  child: imageUrl != null && imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fitWidth,
                          errorWidget: (context, url, error) => Image.asset(
                            "assets/images/image_placeholder.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          "assets/images/image_placeholder.jpg",
                          fit: BoxFit.cover,
                        )),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 4,
                  backgroundColor: Color.fromRGBO(201, 13, 182, 1),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: widgetWidth - 60,
                  child: Text(
                    categoryName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            Container(
              width: widgetWidth,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                title,
                overflow: title.length < 30
                    ? TextOverflow.clip
                    : TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
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
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#A72D6F")),
              ),
            ),
          ],
        ));
  }
}
