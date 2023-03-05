import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/feedback_component.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class FinishReadingComponent extends StatelessWidget {
  const FinishReadingComponent({
    super.key,
    required this.translation,
    required this.storyId,
  });

  final Map<String, String> translation;
  final String storyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 1,
          color: blueColor,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            translation["rating"]!,
            style: TextStyle(
              color: blueColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        FeedbackComponent(),
        SizedBox(
          height: 20,
        ),
        Container(
          color: Color.fromRGBO(167, 45, 111, 1),
          height: 350,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              translation["bottom_text1"]! +
                  storyId.toString() +
                  "-lea" +
                  translation["bottom_text2"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            MainAppButtonComponent(
                color: Colors.white,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                title: translation["claim_badge_button"]!,
                onPressed: () {}),
          ]),
        ),
      ],
    );
  }
}
