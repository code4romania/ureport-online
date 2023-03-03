import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class FeedbackComponent extends StatefulWidget {
  const FeedbackComponent({super.key});

  @override
  State<FeedbackComponent> createState() => _FeedbackComponentState();
}

class _FeedbackComponentState extends State<FeedbackComponent> {
  Map<int, bool> stars = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: stars.keys.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      stars.forEach((key, value) {
                        if (key <= index + 1) {
                          stars[key] = true;
                        } else {
                          stars[key] = false;
                        }
                      });
                    });
                  },
                  child: Icon(
                    stars.values.elementAt(index)
                        ? Icons.star
                        : Icons.star_border,
                    color: blueColor,
                    size: 50,
                  )),
            );
          }),
    );
  }
}
