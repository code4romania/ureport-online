import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
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
  late Map<String, String> _translation;
  final Map<String, List<Result>> mapOfItems = {};
  final Map<String, List<Result>> initMap = {};

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation = translations["${_stateStore.selectedLanguage}"]![
        "articles_category_screen"]!;
    super.initState();

    widget.result.forEach((element) {
      if (mapOfItems.containsKey(element.name!.split('/')[1].trim())) {
        mapOfItems[element.name!.split('/')[1].trim()]!.add(element);
      } else {
        mapOfItems[element.name!.split('/')[1].trim()] = [element];
      }
    });
    initMap.addAll(mapOfItems);
  }

  void search(String value) {
    if (value.isEmpty) {
      setState(() {
        mapOfItems.clear();
        mapOfItems.addAll(initMap);
      });
    } else {
      initMap.keys.forEach((element) {
        if (element.startsWith(value)) {
          setState(() {
            mapOfItems.clear();
            mapOfItems[element] = initMap[element]!;
          });
        }
      });
    }
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
              SearchBarWidget(onSearchChanged: search),
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
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: mapOfItems.length,
                itemBuilder: (context, index) {
                  if (mapOfItems.values.elementAt(index).first.stories !=
                          null &&
                      mapOfItems.values
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
                            mapOfItems.keys.elementAt(index),
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
                                          storyId: mapOfItems.values
                                              .elementAt(index)
                                              .first
                                              .stories!
                                              .first
                                              .id
                                              .toString(),
                                          isComingFromHome: false,
                                        ),
                                      );
                                    },
                                    child: ArticleItemWidget(
                                      article: mapOfItems.values
                                          .elementAt(index)
                                          .first
                                          .stories!
                                          .first,
                                      categoryName: widget.categoryTitle,
                                      subCategoryName:
                                          mapOfItems.keys.elementAt(index),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ArticleCategorySectionComponent(
                                    viewMore: _translation["view_more"]!,
                                    categoryTitle:
                                        mapOfItems.keys.elementAt(index),
                                    onTap: () {
                                      ClickSound.soundTap();

                                      context.router.push(
                                        ArticleListScreenRoute(
                                          categoryTitle: widget.categoryTitle,
                                          subcategoryTitle:
                                              mapOfItems.keys.elementAt(index),
                                          stories: mapOfItems.values
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
