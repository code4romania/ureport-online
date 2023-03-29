import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class RecentStoriesComponent extends StatelessWidget {
  const RecentStoriesComponent({
    super.key,
    required this.translation,
    required this.recentStories,
  });

  final Map<String, String> translation;
  final List<StoryItem> recentStories;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation["recent_articles"]!,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 1,
              width: 300,
              color: purpleColor,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: purpleColor,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 390,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ClickSound.soundTap();

                    context.router.push(
                      ArticleScreenRoute(
                        preloadedStory: recentStories[0],
                        isComingFromHome: true,
                      ),
                    );
                  },
                  child: ArticleItemWidget(
                    articleFull: recentStories[0],
                    categoryName: recentStories[0].category!.name!,
                    subCategoryName:
                        recentStories[0].category!.name!.split("/")[1].trim(),
                    isExpanded: false,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ClickSound.soundTap();

                    context.router.push(
                      ArticleScreenRoute(
                          preloadedStory: recentStories[1],
                          isComingFromHome: true),
                    );
                  },
                  child: ArticleItemWidget(
                    articleFull: recentStories[1],
                    categoryName: recentStories[1].category!.name!,
                    subCategoryName:
                        recentStories[1].category!.name!.split("/")[1].trim(),
                    isExpanded: false,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
