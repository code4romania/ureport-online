import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/translation.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/utils/click_sound.dart';
import 'package:ureport_ecaro/utils/resources.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/components/searchbar_widget.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/components/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/model/category.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';
import 'package:ureport_ecaro/view_model/story_state.dart';

class CategoryListScreen extends StatefulWidget {
  //This screen is only for Romania region

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen>
    with AutomaticKeepAliveClientMixin {
  late StateStore _stateStore;
  late StoryStore _storyStore;
  late Map<String, String> _translation;

  Future _refresh() {
    return _storyStore.fetchCategories();
  }

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _storyStore = StoryStore();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopHeaderWidget(title: _translation["header"]!),
            Container(
              child: Divider(
                height: 1,
                color: Colors.grey[600],
              ),
            ),
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
                      child: CircularProgressIndicator(),
                    );
                  case FutureStatus.rejected:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _translation["no_articles"]!,
                            style: TextStyle(
                                color: Color.fromRGBO(167, 45, 111, 1)),
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
                    final List<Result> categories = future.result;
                    final Map<String, List<Result>> map = {};
                    categories.forEach((element) {
                      final String key = element.name!.split('/')[0].trim();
                      if (map.containsKey(key)) {
                        map[key]!.add(element);
                      } else {
                        map[key] = [element];
                      }
                    });

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: map.keys.length,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          ClickSound.soundTap();
                          context.router.push(
                            ArticlesCategoryScreenRoute(
                              categoryTitle: map.keys.elementAt(index),
                              result: map.values.elementAt(index),
                              storyStore: _storyStore,
                            ),
                          );
                        },
                        child: categoryItem(
                          item: categories.firstWhere(
                            (element) =>
                                element.name!.split('/')[0].trim() ==
                                map.keys.elementAt(index),
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget categoryItem({required Result item}) {
    if (item.stories != null) if (item.stories!.isNotEmpty)
      return Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(28, 171, 226, 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                item.name!.split('/')[0].toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 130,
              width: 130,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: getItemTitleImage(item.imageUrl),
                ),
              ),
            ),
          ],
        ),
      );

    return Container();
  }

  Widget getItemTitleImage(String? imageUrl) {
    return imageUrl != null
        ? ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
              errorWidget: (context, url, error) => Container(
                  color: AppColors.errorWidgetBack,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  )),
            ),
          )
        : Image(
            image: AssetImage("assets/images/image_placeholder.jpg"),
            fit: BoxFit.fill,
          );
  }
}
