import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/view/screens/articles/article/components/article_item.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';
import 'package:ureport_ecaro/view/screens/articles/categories/components/search_bar_widget.dart';
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
  Future _refresh() => _storyStore.fetchStories();

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
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: stories.length,
                            itemBuilder: (context, index) {
                              return ArticleItemWidget(
                                article: stories[index],
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
    );
  }
}
