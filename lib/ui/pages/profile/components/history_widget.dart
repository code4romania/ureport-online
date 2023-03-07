import 'package:flutter/material.dart';
import 'package:ureport_ecaro/models/bookmark.dart';

import '../../../../models/history.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key, required this.history}) : super(key: key);
  final Bookmark history;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Story id: ${history.story}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(-8, 8),
                  spreadRadius: -3,
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                )
              ]),
              child: Image.network(
                  "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
            ),
            Expanded(child: Text("Bookmark id: ${history.id}")),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "SHARE",
                    style: TextStyle(
                      color: Color.fromRGBO(68, 151, 223, 1),
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(253, 209, 243, 1),
          height: 2,
        )
      ]),
    );
  }
}
