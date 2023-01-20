import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/view/screens/articles/article/components/article_item.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view_model/story_state.dart';

class ArticlesListScreen extends StatelessWidget {
  final String categoryImg;
  final String categoryTitle;
  StoryStore _storyStore = StoryStore();

  ArticlesListScreen(Key? key, this.categoryImg, this.categoryTitle)
      : super(key: key) {
    _storyStore.getStories();
  }
  Future _refresh() {
    print("refresh");
    return _storyStore.fetchStories();
  }

  @override
  Widget build(BuildContext context) {
    final future = _storyStore.storiesList;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              // TitleDescriptionWidget(
              //   title: title,
              //   description: "Aici vei găsi articole din domeniul $title.",
              // ),
              //   SearchBarWidget(onSearchChanged: onSearchChanged),
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
                          map.addEntries({
                            MapEntry(
                                element.category!.name!.split("/").last.trim(),
                                map[element.category!.name!] == null
                                    ? [element]
                                    : [
                                        ...map[element.category!.name!]!,
                                        element
                                      ])
                          });
                        });
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: map.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  167, 45, 111, 1)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 350,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, articleIndex) {
                                          return ArticleItemWidget(
                                            article: map.values
                                                .elementAt(index)[articleIndex],
                                          );
                                        },
                                        itemCount:
                                            map.values.elementAt(index).length,
                                      ),
                                    )
                                  ],
                                ),
                              );
                              // return ArticleItemWidget(
                              //   article: stories[index],
                              // );
                            });
                    }
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
