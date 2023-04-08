import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';

class FinishReadingComponent extends StatelessWidget {
  const FinishReadingComponent({
    super.key,
    required this.translation,
    required this.translationProfile,
    required this.storyId,
    required this.profile,
    required this.hasClaimedBadge,
  });

  final Map<String, String> translation;
  final Map<String, String> translationProfile;
  final Profile profile;
  final bool hasClaimedBadge;
  final String storyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.router.pop(),
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              translation["claimed_badge_title"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              //TODO: CHANGE STORY ID TO COUNT...
              translation["claimed_badge_body_1"]! +
                  storyId +
                  translation["claimed_badge_body_2"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            MainAppButtonComponent(
              color: Colors.white,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              title: hasClaimedBadge
                  ? translation["claim_badge_button"]!
                  : translation["continue"]!,
              onPressed: () {
                if (hasClaimedBadge) {
                  context.router.replace(ProfileScreenRoute(
                    translation: translationProfile,
                    profile: profile,
                  ));
                } else {
                  context.router.pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
