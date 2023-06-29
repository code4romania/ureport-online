import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';

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
                    categoryStories.xGetBookmarks();
                    categoryStories.filterBookmarks(0, 'Toate');
                  }),
                  child: _BookmarkWidget(
                    story: categoryStories.bookMarks[index],
                    onTap: () async {
                      context.router.push(
                        ArticleScreenRoute(
                          storyId: categoryStories.bookMarks[index].id,
                          isComingFromHome: false,
                        ),
                      );
                    },
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
                    .then((value) => categoryStories.xGetBookmarks()),
                child: _BookmarkWidget(
                  story: categoryStories.bookmarksFiltered[index],
                  onTap: () async {
                    context.router.push(
                      ArticleScreenRoute(
                        storyId: categoryStories.bookmarksFiltered[index].id,
                        isComingFromHome: false,
                      ),
                    );
                  },
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
  }) : super(key: key);

  final StoryItem story;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    String bookmarkImageUrl = "";

    if (story.images != null && story.images!.isNotEmpty) {
      bookmarkImageUrl = story.images![0];
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedImageComponent(
              imageUrl: bookmarkImageUrl,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                story.category?.name ?? "",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                story.title ?? "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(onPressed: onTap, child: Text('CITESTE MAI MULT')),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
