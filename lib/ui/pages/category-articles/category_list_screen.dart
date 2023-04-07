import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/searchbar_widget.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/title_description_widget.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
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

    _storyStore.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final future = _storyStore.categoryList;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopHeaderWidget(title: _translation["header"]!),
            Container(
              child: Divider(
                height: 1,
                color: Colors.grey[600],
              ),
            ),
            SearchBarWidget(
                onSearchChanged: (value) =>
                    _storyStore.searchCategoryKeyword = value),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            TitleDescriptionWidget(
              title: _translation["title"]!,
              description: _translation["body"]!,
            ),
            Observer(
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

                    return Column(
                      children: [
                        for (int i = 0; i < map.keys.length; i++)
                          GestureDetector(
                            onTap: () {
                              ClickSound.soundTap();
                              context.router.push(
                                ArticlesCategoryScreenRoute(
                                  categoryTitle: map.keys.elementAt(i),
                                  result: map.values.elementAt(i),
                                  storyStore: _storyStore,
                                ),
                              );
                            },
                            child: categoryItem(
                              item: map.values.elementAt(i).first,
                              imageUrl: imagesMap[map.keys.elementAt(i)] ?? "",
                            ),
                          ),
                        Container(
                          height: 60,
                        ),
                      ],
                    );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryItem({required Result item, required String imageUrl}) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(28, 171, 226, 0.5),
      ),
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              item.name!.split('/')[0].toString(),
              style: titleWhiteTextStlye,
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: getItemTitleImage(imageUrl),
            ),
          ),
        ],
      ),
    );

    return Container();
  }

  Widget getItemTitleImage(String? imageUrl) {
    return imageUrl != null
        ? CachedImageComponent(
            width: 120,
            height: 120,
            imageUrl: imageUrl,
          )
        : Image(
            image: AssetImage("assets/images/image_placeholder.jpg"),
            fit: BoxFit.cover,
          );
  }
}
