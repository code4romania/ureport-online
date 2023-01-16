import 'package:flutter/material.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/top_header_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/text_navigator_component.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeaderWidget(title: "Intro"),
      body: Column(children: [
        TextNavigatorComponent(
          title: AppLocalizations.of(context)!.skip,
          onPressed: () {},
          rightEdge: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView(
            controller: pageViewController,
            children: [
              page(0),
              page(1),
              page(2),
            ],
          ),
        ),
        MainAppButtonComponent(
            title: AppLocalizations.of(context)!.continu,
            onPressed: () {
              if (pageViewController.page == 2) {
                //goto register
              } else {
                pageViewController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn);
              }
            })
      ]),
    );
  }

  Widget page(int page) {
    final String text = page == 0
        ? AppLocalizations.of(context)!.intro_text1
        : page == 1
            ? AppLocalizations.of(context)!.intro_text2
            : AppLocalizations.of(context)!.intro_text3;
    final String imagePath = page == 0
        ? "assets/images/drawable-xxhdpi/v2_about_1_ro.png"
        : page == 1
            ? "assets/images/drawable-xxhdpi/v2_about_2_ro.png"
            : "assets/images/into_page_3_ro.png";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              height: 1.2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(imagePath)
        ],
      ),
    );
  }
}
