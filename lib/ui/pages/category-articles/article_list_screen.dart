import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/searchbar_widget.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({
    super.key,
    required this.categoryTitle,
    required this.subcategoryTitle,
    required this.storyStore,
    required this.stories,
  });

  final String categoryTitle;
  final String subcategoryTitle;
  final CategoryStories storyStore;
  final List<Story> stories;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  late StateStore _stateStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["articles_screen"]!;
    super.initState();

    widget.storyStore.setInitialStoryList(widget.stories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      widget.categoryTitle,
                      style: titleWhiteTextStlye,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                  widget.subcategoryTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              SearchBarWidget(
                onSearchChanged: widget.storyStore.searchStory,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  _translation["body"]! +
                      " " +
                      widget.subcategoryTitle +
                      " " +
                      _translation["body2"]! +
                      " " +
                      widget.categoryTitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Observer(builder: (context) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.storyStore.stories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ClickSound.soundTap();

                              context.router.push(
                                ArticleScreenRoute(
                                  storyId: widget.storyStore.stories[index].id,
                                  isComingFromHome: false,
                                ),
                              );
                            },
                            child: ArticleItemWidget(
                              article: widget.storyStore.stories[index],
                              width: MediaQuery.of(context).size.width,
                              categoryName: widget.categoryTitle,
                              subCategoryName: widget.subcategoryTitle,
                            ),
                          );
                        });
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
