import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/category_list_search_screen.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/badges_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/bookmark_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/searchbar_widget.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/title_description_widget.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/hex_colors_utils.dart';
import 'package:ureport_ecaro/utils/translation.dart';

import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';

class CategoryListScreen extends StatefulWidget {
  //This screen is only for Romania region

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late StateStore _stateStore;
  late CategoryStories _storyStore;
  late Map<String, String> _translation;
  FocusNode _focusNode = FocusNode();

  Future _refresh() {
    return _storyStore.fetchCategories();
  }

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _storyStore = CategoryStories();

    _translation =
        translations["${_stateStore.selectedLanguage}"]!["category_screen"]!;
    super.initState();
    _storyStore.getBadges();
    _storyStore.fetchCategories();
    _storyStore.xGetBookmarks();
    _storyStore.filterBookmarks(0, _translation["all"]!, _translation["all"]!);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = _storyStore.categoryList;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            _focusNode.unfocus();
          }
          return true;
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: TopHeaderWidget(title: _translation["header"]!),
            ),
            SliverToBoxAdapter(
              child: BadgesComponent(
                categoryStories: _storyStore,
                translation: _translation,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Text(
                  _translation['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Observer(
                builder: (context) {
                  if (future == null) {
                    return Text(
                      _translation["no_articles"]!,
                      style: TextStyle(color: Colors.black),
                    );
                  }
                  switch (future.status) {
                    case FutureStatus.pending:
                      return Center(
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: LoadingIndicatorComponent()),
                      );
                    case FutureStatus.rejected:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _translation["no_articles_list"]!,
                              style: TextStyle(color: purpleColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            MainAppButtonComponent(
                              title: _translation["retry"]!,
                              onPressed: _refresh,
                            )
                          ],
                        ),
                      );
                    case FutureStatus.fulfilled:
                      List<Result> categories = future.result;
                      if (categories.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _translation["no_articles_list"]!,
                                style: TextStyle(color: purpleColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              MainAppButtonComponent(
                                title: _translation["retry"]!,
                                onPressed: _refresh,
                              ),
                            ],
                          ),
                        );
                      }
                      _storyStore.initialCategoryList = future.result;

                      if (_storyStore.searchCategoryKeyword != null &&
                          _storyStore.searchCategoryKeyword!.isNotEmpty) {
                        categories = _storyStore.initialCategoryList!
                            .where((element) => element.name!
                                .toLowerCase()
                                .startsWith(_storyStore.searchCategoryKeyword!
                                    .toLowerCase()))
                            .toList();
                      } else {
                        categories = _storyStore.initialCategoryList!;
                      }

                      final Map<String, List<Result>> map = {};
                      final Map<String, String> imagesMap = {};
                      if (categories.isEmpty) {
                        return Text(
                          _translation["no_articles"]!,
                          style: TextStyle(color: Colors.black),
                        );
                      }

                      categories.forEach((element) {
                        if (!element.name!.contains('/')) {
                          imagesMap[element.name!.split('/')[0].trim()] =
                              element.image_url ?? "";
                        } else {
                          final String key = element.name!.split('/')[0].trim();
                          if (map.containsKey(key)) {
                            map[key]!.add(element);
                          } else {
                            map[key] = [element];
                          }
                        }
                      });
                      _storyStore.setCategories(map, _translation["all"]!);
                      return Container(
                        height: 89,
                        margin: EdgeInsets.only(left: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ClickSound.soundTap();
                                context.router
                                    .push(
                                  ArticlesCategoryScreenRoute(
                                    categoryTitle: map.keys.elementAt(index),
                                    result: map.values.elementAt(index),
                                    storyStore: _storyStore,
                                  ),
                                )
                                    .then((value) {
                                  _storyStore.xGetBookmarks();
                                  _storyStore.filterBookmarks(
                                      0,
                                      _translation["all"]!,
                                      _translation["all"]!);
                                });
                              },
                              child: categoryItem(
                                item: map.values.elementAt(index).first,
                                imageUrl:
                                    imagesMap[map.keys.elementAt(index)] ?? "",
                              ),
                            );
                          },
                          itemCount: map.keys.length - 1,
                        ),
                      );
                  }
                },
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              sliver: SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    ClickSound.soundTap();
                    context.router
                        .push(CategoryListSearchScreenRoute())
                        .then((value) {
                      _storyStore.xGetBookmarks();
                      _storyStore.filterBookmarks(
                          0, _translation["all"]!, _translation["all"]!);
                    });
                  },
                  child: Text(
                    _translation["see_all"]!,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color.fromARGB(255, 159, 75, 152),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 10, bottom: 5, top: 15),
                child: Text(
                  _translation['title_bookmarks']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 10),
                child: Observer(
                  builder: (context) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Observer(
                          builder: (context) => ChoiceChip(
                            selectedColor: HexColor("#FBE3F9"),
                            label: Text(
                              _storyStore.categories!.keys.elementAt(index),
                              style: TextStyle(
                                  fontWeight:
                                      _storyStore.selectedCategory == index
                                          ? FontWeight.w700
                                          : FontWeight.w500,
                                  color: _storyStore.selectedCategory == index
                                      ? HexColor('#9F4B98')
                                      : HexColor('#1E3A8A'),
                                  fontSize: 14.0,
                                  fontFamily: 'inter'),
                            ),
                            selected: _storyStore.selectedCategory == index,
                            onSelected: (selected) {
                              if (selected) {
                                _storyStore.filterBookmarks(
                                  index,
                                  _storyStore.categories!.keys.elementAt(index),
                                  _translation["all"]!,
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: _storyStore.categories?.length ?? 0,
                  ),
                ),
              ),
            ),
            BookmarkComponent(
              categoryStories: _storyStore,
              translation: _translation,
              categories: _storyStore.categories,
            ),
            SliverPadding(padding: EdgeInsets.only(top: 30.0)),
          ],
        ),
      ),
    );
  }

  Widget categoryItem({required Result item, required String imageUrl}) {
    return Container(
      height: 87,
      width: 89,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(28, 171, 226, 0.5),
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: getItemTitleImage(imageUrl),
          ),
          Text(
            item.name!.split('/')[0].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 10.12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'inter'),
          ),
        ],
      ),
    );
  }

  Widget getItemTitleImage(String? imageUrl) {
    return imageUrl != null
        ? CachedImageComponent(
            width: 63,
            height: 47,
            imageUrl: imageUrl,
          )
        : Image(
            image: AssetImage("assets/images/image_placeholder.jpg"),
            fit: BoxFit.cover,
          );
  }
}
