import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';

class BadgesComponent extends StatelessWidget {
  final CategoryStories categoryStories;
  final Map<String, String> translation;
  const BadgesComponent({
    super.key,
    required this.categoryStories,
    required this.translation,
  });

  int getBadgesCount() {
    return categoryStories.badges
        .where((element) => element.owned == true)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (categoryStories.badgesLoading) {
        return Center(child: LoadingIndicatorComponent());
      }
      return Container(
        height: 186,
        padding: EdgeInsets.only(
          left: 10.0,
          top: 20.0,
        ),
        color: Color(0xFF1CABE2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getBadgesCount() != 0
                  ? translation["badges_obtained_text1"]! +
                      " " +
                      getBadgesCount().toString() +
                      " " +
                      translation['badges_obtained_tet2']!
                  : " " + translation["read_articles_obtain_badges"]!,
              style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '${categoryStories.storyReadCount} ${translation["article_read"]}',
              style: TextStyle(
                  fontFamily: 'inter',
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryStories.badges.length,
                itemBuilder: (context, index) => _MedalWidget(
                  medal: categoryStories.badges[index],
                  isLastItem: index == categoryStories.badges.length - 1,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    ClickSound.soundTap();
                    context.router.push(
                      BadgesScreenRoute(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      translation["see_all"]!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'inter',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _MedalWidget extends StatelessWidget {
  const _MedalWidget({
    Key? key,
    required this.medal,
    required this.isLastItem,
  }) : super(key: key);

  final BadgeMedal medal;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        width: 59,
        height: 59,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(-8, 8),
            spreadRadius: -3,
            blurRadius: 4,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          )
        ]),
        child: getItemTitleImage(
          medal.image,
          medal.owned == true ? null : true,
        ));
  }
}

Widget getItemTitleImage(String? imageUrl, bool? blockedImage) {
  return imageUrl != null
      ? CachedImageComponent(
          width: 59,
          height: 59,
          imageUrl: imageUrl,
          blockedImage: blockedImage,
        )
      : Image(
          image: AssetImage("assets/images/image_placeholder.jpg"),
          fit: BoxFit.cover,
        );
}
