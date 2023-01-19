import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/top_header_widget.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Result article;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            TopHeaderWidget(title: "Categorii"),
            CachedNetworkImage(
              imageUrl: article.images![0],
              width: MediaQuery.of(context).size.width,
              height: 100,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Image.asset(
                "assets/images/image_placeholder.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                  Text(
                    article.category!.name!.split('/')[1].trim(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                article.title!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Autor",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text("UNICEF România")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Date",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      Text(formatter.format(article.createdOn!))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    article.content!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
