import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/components/article_item.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/components/searchbar_widget.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/components/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/model/story.dart';

import 'package:ureport_ecaro/view/shared/top_header_widget.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({
    super.key,
    required this.articles,
    required this.categoryTitle,
    required this.subcategoryTitle,
  });

  final List<Result> articles;
  final String categoryTitle;
  final String subcategoryTitle;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  List<Result> finalArticleList = [];

  @override
  void initState() {
    finalArticleList = widget.articles;
    super.initState();
  }

  void searchList(String? value) {
    if (value != null && value.isNotEmpty) {
      List<Result> tempList = [];
      for (int i = 0; i < widget.articles.length; i++) {
        if (widget.articles[i].title!
            .toLowerCase()
            .startsWith(value.toLowerCase())) {
          tempList.add(widget.articles[i]);
        }
      }
      setState(() {
        finalArticleList = tempList;
      });
      tempList = [];
    } else {
      setState(() {
        finalArticleList = widget.articles;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TopHeaderWidget(title: AppLocalizations.of(context)!.stories),
              SearchBarWidget(
                onSearchChanged: searchList,
              ),
              SizedBox(
                height: 20,
              ),
              TitleDescriptionWidget(
                title: widget.categoryTitle,
                description:
                    "Aici vei găsi articole din domeniul ${widget.subcategoryTitle}.",
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: finalArticleList.length,
                      itemBuilder: (context, index) {
                        return ArticleItemWidget(
                          article: finalArticleList[index],
                          width: MediaQuery.of(context).size.width,
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
