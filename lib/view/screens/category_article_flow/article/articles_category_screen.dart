import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/components/article_category_section_component.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/components/article_item.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/article/model/story.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/shared/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view_model/story_state.dart';

class ArticlesCategoryScreen extends StatelessWidget {
  final String categoryImg;
  final String categoryTitle;
  StoryStore _storyStore = StoryStore();

  ArticlesCategoryScreen(Key? key, this.categoryImg, this.categoryTitle)
      : super(key: key) {
    _storyStore.getStories();
  }

  Future _refresh() {
    return _storyStore.fetchStories();
  }

  @override
  Widget build(BuildContext context) {
    final future = _storyStore.storiesList;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                TopHeaderWidget(title: AppLocalizations.of(context)!.stories),
                CachedNetworkImage(
                  imageUrl: categoryImg,
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/image_placeholder.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: <Widget>[
                    TitleDescriptionWidget(
                      title: "Articole",
                      description:
                          "Aici vei găsi articole din domeniul $categoryTitle. Află mai multe despre prevenția bolilor, sănătatea mintală și multe altele.",
                    ),
                    Observer(builder: (_) {
                      if (future == null) {
                        return Text(
                          "No data",
                          style: TextStyle(color: Colors.black),
                        );
                      }
                      switch (future.status) {
                        case FutureStatus.pending:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        case FutureStatus.rejected:
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Failed to load items.',
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                MainAppButtonComponent(
                                  title: 'Tap to retry',
                                  onPressed: _refresh,
                                )
                              ],
                            ),
                          );
                        case FutureStatus.fulfilled:
                          final List<Result> stories = future.result.results;
                          final Map<String, List<Result>> map = {};
                          stories.forEach((element) {
                            if (map.containsKey(
                                element.category!.name!.split('/')[1].trim())) {
                              map[element.category!.name!.split('/')[1].trim()]!
                                  .add(element);
                            } else {
                              map[element.category!.name!
                                  .split('/')[1]
                                  .trim()] = [element];
                            }
                          });

                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: map.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 20,
                                  ),
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        map.keys.elementAt(index),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                            height: 1,
                                            width: 200,
                                            color:
                                                Color.fromRGBO(167, 45, 111, 1),
                                          ),
                                          Container(
                                            height: 8,
                                            width: 8,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromRGBO(
                                                  167, 45, 111, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 390,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ArticleItemWidget(
                                                article: map.values
                                                    .elementAt(index)[0],
                                              ),
                                            ),
                                            Expanded(
                                              child:
                                                  ArticleCategorySectionComponent(
                                                categoryTitle:
                                                    map.keys.elementAt(index),
                                                onTap: () =>
                                                    context.router.push(
                                                  ArticleListScreenRoute(
                                                    categoryTitle:
                                                        categoryTitle,
                                                    subcategoryTitle: map.keys
                                                        .elementAt(index),
                                                    articles: map.values
                                                        .elementAt(index),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
