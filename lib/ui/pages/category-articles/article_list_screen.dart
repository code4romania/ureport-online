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
    required this.stories,
  });

  final String categoryTitle;
  final String subcategoryTitle;
  final List<Story> stories;

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  late StateStore _stateStore;
  late Map<String, String> _translation;
  late CategoryStories _storyStore;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["articles_screen"]!;
    super.initState();

    _storyStore = CategoryStories();
    _storyStore.setInitialStoryList(widget.stories);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              _focusNode.unfocus();
            }
            return true;
          },
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
                      Expanded(
                        child: Text(
                          widget.categoryTitle,
                          style: titleWhiteTextStlye,
                        ),
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
                  onSearchChanged: _storyStore.searchStory,
                  focusNode: _focusNode,
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
                          itemCount: _storyStore.stories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ClickSound.soundTap();

                                context.router.push(
                                  ArticleScreenRoute(
                                    storyId: _storyStore.stories[index].id,
                                    isComingFromHome: false,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 20,
                                  left: 10,
                                ),
                                child: ArticleItemWidget(
                                  article: _storyStore.stories[index],
                                  width: MediaQuery.of(context).size.width,
                                  categoryName: widget.categoryTitle,
                                  subCategoryName: widget.subcategoryTitle,
                                  isExpanded: true,
                                ),
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
      ),
    );
  }
}
