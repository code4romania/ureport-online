import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/translation.dart';
import 'package:ureport_ecaro/utils/app_router.gr.dart';
import 'package:ureport_ecaro/view/shared/top_header_widget.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageViewController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _state = context.read<StateStore>();
    final Map<String, String> _translation =
        translations["${_state.selectedLanguage}"]!["open_app_screen"]!;

    return Scaffold(
      appBar: TopHeaderWidget(title: _translation["header"]!),
      body: Column(children: [
        TextNavigatorComponent(
          title: _translation["skip"]!,
          onPressed: () => context.router.push(LoginScreenRoute()),
          rightEdge: true,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView(
            controller: pageViewController,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            children: [
              page(0, _translation["onboard_text1"]!),
              page(1, _translation["onboard_text2"]!),
              page(2, _translation["onboard_text3"]!),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dot(pageIndex == 0),
            SizedBox(
              width: 10,
            ),
            dot(pageIndex == 1),
            SizedBox(
              width: 10,
            ),
            dot(pageIndex == 2),
          ],
        ),
        MainAppButtonComponent(
            title: _translation["next"]!,
            onPressed: () {
              if (pageViewController.page == 2) {
                //goto register
                context.router.push(LoginScreenRoute());
              } else {
                pageViewController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn);
              }
            })
      ]),
    );
  }

  Widget dot(bool isActive) {
    return Container(
      width: isActive ? 20 : 10,
      height: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: Color.fromRGBO(167, 45, 111, 1),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget page(int page, String text) {
    final String imagePath = page == 0
        ? "assets/images/v2_about_1_ro.png"
        : page == 1
            ? "assets/images/v2_about_2_ro.png"
            : "assets/images/v2_about_3_ro.png";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                height: 1.2,
              ),
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
