import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/response_opinions.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_item.dart';
import 'package:ureport_ecaro/ui/pages/opinion/components/opinion_item.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class RecentOpinionsComponent extends StatelessWidget {
  const RecentOpinionsComponent({
    super.key,
    required this.translation,
    required this.recentOpinions,
  });

  final Map<String, String> translation;
  final List<Question> recentOpinions;

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      purpleColor,
      purpleColor,
      purpleColor,
    ];
    int colorNumber = 0;
    if (colorNumber > colors.length - 1) {
      colorNumber = 0;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation["recent_opinions"]!,
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
        OpinionItem(
            recentOpinions[0],
            colors[recentOpinions[0].resultsByGender.length != 0
                ? colorNumber++
                : colorNumber]),
        OpinionItem(
            recentOpinions[1],
            colors[recentOpinions[1].resultsByGender.length != 0
                ? colorNumber++
                : colorNumber]),
      ],
    );
  }
}
