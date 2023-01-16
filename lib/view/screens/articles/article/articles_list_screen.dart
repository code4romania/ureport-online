import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/view/screens/articles/article/components/article_item.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/article.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/top_header_widget.dart';

class ArticlesListView extends StatelessWidget {
  ArticlesListView({
    Key? key,
    required this.list,
    required this.title,
    required this.categoryImage,
  }) : super(key: key);

  final String title;
  final String categoryImage;
  final List<Article> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TopHeaderWidget(title: title),
              CachedNetworkImage(
                imageUrl: categoryImage,
                width: MediaQuery.of(context).size.width,
                height: 180,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              TitleDescriptionWidget(
                title: title,
                description: "Aici vei găsi articole din domeniul $title.",
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ArticleItemWidget(
                          article: list[index],
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
