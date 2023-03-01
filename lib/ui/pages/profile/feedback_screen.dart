import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import '../../shared/general_button_component.dart';
import '../../shared/text_navigator_component.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key, required this.translations});
  final Map<String, String> translations;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopHeaderWidget(title: translations["header"]!),
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
              translations["body"]!,
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
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Text(translations["write_message"]!)),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              maxLines: 20,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MainAppButtonComponent(
            title: translations["send"]!,
            onPressed: () {},
          ),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/unicef_about.png",
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}
