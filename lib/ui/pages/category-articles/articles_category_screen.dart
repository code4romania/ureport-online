import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/controllers/story_state.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_category_section_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';

class ArticlesCategoryScreen extends StatefulWidget {
  final List<Result> result;
  final String categoryTitle;
  final StoryStore storyStore;

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

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation = translations["${_stateStore.selectedLanguage}"]![
        "articles_category_screen"]!;
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
              Builder(builder: (context) {
                final Map<String, List<Result>> map = {};
                widget.result.forEach((element) {
                  if (map.containsKey(element.name!.split('/')[1].trim())) {
                    map[element.name!.split('/')[1].trim()]!.add(element);
                  } else {
                    map[element.name!.split('/')[1].trim()] = [element];
                  }
                });

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: map.length,
                  itemBuilder: (context, index) {
                    if (map.values.elementAt(index).first.stories != null &&
                        map.values.elementAt(index).first.stories!.isNotEmpty)
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
                              map.keys.elementAt(index),
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
                                            storyStore: widget.storyStore,
                                            subCategory:
                                                map.keys.elementAt(index),
                                            storyId: map.values
                                                .elementAt(index)
                                                .first
                                                .stories!
                                                .first
                                                .id
                                                .toString(),
                                          ),
                                        );
                                      },
                                      child: ArticleItemWidget(
                                        article: map.values
                                            .elementAt(index)
                                            .first
                                            .stories!
                                            .first,
                                        categoryName: widget.categoryTitle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ArticleCategorySectionComponent(
                                      viewMore: _translation["view_more"]!,
                                      categoryTitle: map.keys.elementAt(index),
                                      onTap: () {
                                        ClickSound.soundTap();

                                        context.router.push(
                                          ArticleListScreenRoute(
                                            categoryTitle: widget.categoryTitle,
                                            subcategoryTitle:
                                                map.keys.elementAt(index),
                                            stories: map.values
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
              })
            ],
          ),
        ),
      ),
    );
  }
}
