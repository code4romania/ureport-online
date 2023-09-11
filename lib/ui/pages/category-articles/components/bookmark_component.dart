import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/utils/hex_colors_utils.dart';

class BookmarkComponent extends StatelessWidget {
  final CategoryStories categoryStories;
  final Map<String, List<Result>>? categories;
  final Map<String, String> translation;
  const BookmarkComponent({
    super.key,
    required this.categoryStories,
    required this.translation,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (categoryStories.bookmarksLoading) {
        return SliverToBoxAdapter(
            child: Center(child: LoadingIndicatorComponent()));
      } else if (categoryStories.bookMarks.isEmpty) {
        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 5.0,
              color: Color(0xFFF6F6F6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/no_bookmarks.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(translation["no_bookmarks"]!)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        if (categoryStories.bookmarksFiltered.isEmpty &&
            categoryStories.hasFilter) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 5.0,
                color: Color(0xFFF6F6F6),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/no_bookmarks.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            translation["no_bookmarks_filtered"]! +
                                categoryStories.categories!.keys.elementAt(
                                  categoryStories.selectedCategory,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (categoryStories.bookmarksFiltered.isNotEmpty) {
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => context.router
                      .push(
                    ArticleScreenRoute(
                      isComingFromHome: false,
                      storyId: categoryStories.bookMarks[index].id,
                    ),
                  )
                      .then((value) {
                    categoryStories.getBookmarks();
                    categoryStories.filterBookmarks(
                        0, translation["all"]!, translation["all"]!);
                  }),
                  child: _BookmarkWidget(
                    story: categoryStories.bookMarks[index],
                    textReadMore: translation["read_more"]!,
                    onTap: () async {
                      context.router.push(
                        ArticleScreenRoute(
                          storyId: categoryStories.bookMarks[index].id,
                          isComingFromHome: false,
                        ),
                      );
                    },
                    isExpanded: true,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            }, childCount: categoryStories.bookMarks.length),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => context.router
                    .push(
                      ArticleScreenRoute(
                        isComingFromHome: false,
                        storyId: categoryStories.bookmarksFiltered[index].id,
                      ),
                    )
                    .then((value) => categoryStories.getBookmarks()),
                child: _BookmarkWidget(
                  story: categoryStories.bookmarksFiltered[index],
                  textReadMore: translation["read_more"]!,
                  onTap: () async {
                    context.router.push(
                      ArticleScreenRoute(
                        storyId: categoryStories.bookmarksFiltered[index].id,
                        isComingFromHome: false,
                      ),
                    );
                  },
                  isExpanded: true,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            );
          }, childCount: categoryStories.bookmarksFiltered.length),
        );
      }
    });
  }
}

class _BookmarkWidget extends StatelessWidget {
  const _BookmarkWidget({
    Key? key,
    required this.story,
    required this.onTap,
    required this.textReadMore,
    required this.width,
    required this.isExpanded,
  }) : super(key: key);

  final StoryItem story;
  final VoidCallback onTap;
  final String textReadMore;
  final double? width;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = width ?? 190;

    String imageUrl = "";
    String title = "";

    title = story.title ?? '';
    if (story.images != null) {
      imageUrl = story.images!.first;
    }

    return Container(
        width: widgetWidth,
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          bottom: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(8, 8),
                spreadRadius: 2,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: imageUrl.isNotEmpty
                  ? CachedImageComponent(
                      width: widgetWidth,
                      height: isExpanded ? 230 : 172,
                      // 4/3 aici
                      // 16/9 landscape

                      imageUrl: imageUrl,
                    )
                  : Image.asset(
                      "assets/images/image_placeholder.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Color.fromRGBO(155, 13, 132, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: widgetWidth - 80,
                    child: Text(
                      story.category?.name ?? '',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: widgetWidth,
              margin: EdgeInsets.only(
                left: 15,
                top: 10,
                right: 5,
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 2 : 3,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 20,
              width: widgetWidth,
              margin: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Text(
                textReadMore,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#A72D6F"),
                ),
              ),
            ),
          ],
        ));
  }
}
