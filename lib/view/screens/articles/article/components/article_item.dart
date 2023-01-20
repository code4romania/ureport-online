import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/hex_colors_utils.dart';
import 'package:ureport_ecaro/view/screens/articles/article/article_screen.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Result article;

  @override
  Widget build(BuildContext context) {
    double width = 160;

    return GestureDetector(
      // onTap: () => NavUtils.push(
      //     context,
      //     StoryDetails(article.id.toString(), article.title.toString(),
      //         article.image, article.date)),
      onTap: () => context.router.push(ArticleScreenRoute(
          article: article,
          title: article.title!,
          image: article.images != null && article.images?.length != 0
              ? article.images!.first
              : "",
          date: article.createdOn.toString())),
      child: Container(
          width: 180,
          margin: EdgeInsets.only(top: 20, left: 10),
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
                    width: width,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20)),
                    ),
                    child: article.images != null && article.images?.length != 0
                        ? CachedNetworkImage(
                            imageUrl: article.images!.first,
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
              Container(
                width: width,
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Color.fromRGBO(201, 13, 182, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: width - 40,
                      child: Text(
                        article.category!.name!.split('/')[1].trim(),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  article.title!,
                  overflow: "${article.title}".length < 30
                      ? TextOverflow.clip
                      : TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: width,
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
          )),
    );
  }
}
