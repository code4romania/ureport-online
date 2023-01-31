import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/view/shared/general_button_component.dart';
import 'package:ureport_ecaro/view/shared/text_navigator_component.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextNavigatorComponent(
          title: "ÎNAPOI",
          onPressed: () => context.router.pop(),
          rightEdge: false,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Spune-ne părerea ta",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Orice sugestie ne ajută să îmbunătățim aplicația așa că te rugăm să ne trimiți un mesaj cu ideile tale de noi funcționalități sau propuneri de schimbare. ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 20,
        ),
        Text("Scrie aici mesajul tau"),
        SizedBox(
          height: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            maxLines: 20,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MainAppButtonComponent(
          title: "Trimite mesaj",
          onPressed: () {},
        )
      ]),
    )));
  }
}
