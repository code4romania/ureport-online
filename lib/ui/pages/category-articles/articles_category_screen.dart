import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/article_category_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
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
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _articleCategoryStore.mapOfItems.keys.length,
                  itemBuilder: (context, index) {
                    if (_articleCategoryStore.mapOfItems.values
                                .elementAt(index)
                                .first
                                .stories !=
                            null &&
                        _articleCategoryStore.mapOfItems.values
                            .elementAt(index)
                            .first
                            .stories!
                            .isNotEmpty)
                      return Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _articleCategoryStore.mapOfItems.keys
                                  .elementAt(index),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 390,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        ClickSound.soundTap();

                                        context.router.push(
                                          ArticleScreenRoute(
                                            storyId: _articleCategoryStore
                                                .mapOfItems.values
                                                .elementAt(index)
                                                .first
                                                .stories!
                                                .first
                                                .id,
                                            isComingFromHome: false,
                                          ),
                                        );
                                      },
                                      child: ArticleItemWidget(
                                        article: _articleCategoryStore
                                            .mapOfItems.values
                                            .elementAt(index)
                                            .first
                                            .stories!
                                            .first,
                                        isExpanded: false,
                                        categoryName: widget.categoryTitle,
                                        subCategoryName: _articleCategoryStore
                                            .mapOfItems.keys
                                            .elementAt(index),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ArticleCategorySectionComponent(
                                      viewMore: _translation["view_more"]!,
                                      categoryTitle: _articleCategoryStore
                                          .mapOfItems.keys
                                          .elementAt(index),
                                      onTap: () {
                                        ClickSound.soundTap();

                                        context.router.push(
                                          ArticleListScreenRoute(
                                            categoryTitle: widget.categoryTitle,
                                            subcategoryTitle:
                                                _articleCategoryStore
                                                    .mapOfItems.keys
                                                    .elementAt(index),
                                            stories: _articleCategoryStore
                                                .mapOfItems.values
                                                .elementAt(index)
                                                .first
                                                .stories!,
                                            storyStore: widget.storyStore,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    else
                      return Container();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
