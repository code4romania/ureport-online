import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/article_category_store.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_category_section_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/searchbar_widget.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';

class ArticlesCategoryScreen extends StatefulWidget {
  final List<Result> result;
  final String categoryTitle;
  final CategoryStories storyStore;

  ArticlesCategoryScreen({
    super.key,
    required this.result,
    required this.categoryTitle,
    required this.storyStore,
  });

  @override
  State<ArticlesCategoryScreen> createState() => _ArticlesCategoryScreenState();
}

class _ArticlesCategoryScreenState extends State<ArticlesCategoryScreen> {
  late StateStore _stateStore;
  late ArticleCategoryStore _articleCategoryStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation = translations["${_stateStore.selectedLanguage}"]![
        "articles_category_screen"]!;
    _articleCategoryStore = ArticleCategoryStore(widget.result);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              TopHeaderWidget(title: _translation["header"]!),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 20),
                color: Color.fromRGBO(28, 171, 226, 1),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextNavigatorComponent(
                      rightEdge: false,
                      darkMode: true,
                      title: _translation["back"]!,
                      onPressed: () => context.router.pop(),
                    ),
                    Text(
                      _translation["title"]!,
                      style: titleWhiteTextStlye,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ),
              SearchBarWidget(onSearchChanged: _articleCategoryStore.search),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  _translation["body"]! + " " + widget.categoryTitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Observer(builder: (context) {
                final widgets = <Widget>[];

                _articleCategoryStore.mapOfItems.forEach((key, value) {
                  widgets.add(SubcategoryHolder(
                    subcategoryName: key,
                    story: value,
                    viewMoreText: _translation["view_more"]!,
                  ));
                });

                return Column(
                  children: widgets,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleItemShortcut extends StatelessWidget {
  const ArticleItemShortcut({
    super.key,
    required this.storyId,
    this.story,
    required this.categoryTitle,
    required this.subcategoryTitle,
  });

  final int storyId;
  final Story? story;
  final String categoryTitle;
  final String subcategoryTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ClickSound.soundTap();

        context.router.push(
          ArticleScreenRoute(
            storyId: storyId,
            isComingFromHome: false,
          ),
        );
      },
      child: Container(
        height: 390,
        child: ArticleItemWidget(
          article: story,
          isExpanded: false,
          categoryName: categoryTitle,
          subCategoryName: subcategoryTitle,
        ),
      ),
    );
  }
}

class ArticlesListHolder extends StatelessWidget {
  const ArticlesListHolder({
    super.key,
    required this.result,
    required this.viewMoreText,
  });

  final Result result;
  final String viewMoreText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...result.stories
                  ?.take(3)
                  .map((e) => ArticleItemShortcut(
                        storyId: e.id!,
                        story: e,
                        categoryTitle: result.name?.split(" / ").first ?? "",
                        subcategoryTitle: result.name?.split(" / ").last ?? "",
                      ))
                  .toList() ??
              [],
          ArticleCategorySectionComponent(
            viewMore: viewMoreText,
            subCategoryTitle: result.name?.split(" / ").last ?? "",
            onTap: () {
              ClickSound.soundTap();
              context.router.push(
                ArticleListScreenRoute(
                  categoryTitle: result.name?.split(" / ").first ?? "",
                  subcategoryTitle: result.name?.split(" / ").last ?? "",
                  stories: result.stories ?? [],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SubcategoryHolder extends StatelessWidget {
  const SubcategoryHolder({
    super.key,
    required this.subcategoryName,
    required this.story,
    required this.viewMoreText,
  });

  final String subcategoryName;
  final List<Result> story;
  final String viewMoreText;

  @override
  Widget build(BuildContext context) {
    return story.isNotEmpty
        ? Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subcategoryName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 1,
                      width: 200,
                      color: purpleColor,
                    ),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
                ArticlesListHolder(
                  result: story.first,
                  viewMoreText: viewMoreText,
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
