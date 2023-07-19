import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key, required this.translations}) : super(key: key);
  final Map<String, String> translations;

  late ScrollController _scrollController;

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();

    return Scaffold(
      appBar: TopHeaderWidget(title: translations["header"]!),
      floatingActionButton: GestureDetector(
        onTap: _scrollToTop,
        child: Container(
            width: 50,
            height: 50,
            child: Image.asset("assets/images/arrow_up_rectangular.png")),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNavigatorComponent(
              title: translations["back"]!,
              onPressed: () => context.router.pop(),
              rightEdge: false,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                  translations["title"]!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                translations["text1"]!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/unicef_about.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                translations["text2"]!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                translations["text2.1"]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                translations["text3"]!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                translations["text4"]!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/unicef_about.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(
                translations["text5"]!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset(
                "assets/images/c4r_logo.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: translations["text6"],
                    ),
                    TextSpan(
                      text: "Icons8",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse("https://icons8.com/"));
                        },
                    ),
                    TextSpan(
                      text: '.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
