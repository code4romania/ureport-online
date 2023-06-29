import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (categoryStories.badgesLoading) {
        return Center(child: LoadingIndicatorComponent());
      }
      if (categoryStories.badges.isEmpty) {
        return Center(child: Text(translation["no_badges"]!));
      } else {
        return Container(
          height: 180,
          padding: EdgeInsets.only(
            left: 10.0,
            top: 20.0,
          ),
          color: Color(0xFF1CABE2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryStories.badges.length,
                  itemBuilder: (context, index) => _MedalWidget(
                    onPressedShare: () async {
                      var response = await http
                          .get(Uri.parse(categoryStories.badges[index].image!));
                      final directory = await getTemporaryDirectory();
                      final imagePath = '${directory.path}/image.jpg';

                      // Save the image to a temporary file
                      File imageFile = File(imagePath);
                      await imageFile.writeAsBytes(response.bodyBytes);

                      final text =
                          '${translation["shareMedalTitle"]!}\n${translation["shareMedalBody"]!}';
                      Share.shareXFiles([XFile(imagePath)], text: text);
                    },
                    medal: categoryStories.badges[index],
                    isLastItem: index == categoryStories.badges.length - 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ClickSound.soundTap();
                  context.router.push(
                    BadgesScreenRoute(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Vezi toate', // TODO : XX
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

class _MedalWidget extends StatelessWidget {
  const _MedalWidget({
    Key? key,
    required this.medal,
    required this.isLastItem,
    required this.onPressedShare,
  }) : super(key: key);

  final BadgeMedal medal;
  final bool isLastItem;
  final VoidCallback onPressedShare;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(-8, 8),
              spreadRadius: -3,
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            )
          ]),
          child: CachedImageComponent(
            imageUrl: medal.image ?? "",
            blockedImage: medal.owned == true ? null : true,
          ),
        ),
      ],
    );
  }
}
