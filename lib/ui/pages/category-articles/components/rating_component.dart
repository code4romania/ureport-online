import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class RatingComponent extends StatefulWidget {
  const RatingComponent({
    super.key,
    required this.onRate,
    required this.ratingTitle,
    required this.ratingBody,
    required this.submitText,
    required this.initialRating,
  });

  final String ratingTitle;
  final String ratingBody;
  final String submitText;
  final int? initialRating;
  final Function(int) onRate;

  @override
  State<RatingComponent> createState() => _RatingComponentState();
}

class _RatingComponentState extends State<RatingComponent> {
  late Map<int, bool> stars;

  @override
  void initState() {
    stars = {
      1: false,
      2: false,
      3: false,
      4: false,
      5: false,
    };

    if (widget.initialRating != null) {
      stars.forEach((key, value) {
        if (key <= widget.initialRating!) {
          stars[key] = true;
        } else {
          stars[key] = false;
        }
      });
    }

    super.initState();
  }

  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.close,
                color: Color.fromRGBO(31, 41, 55, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                widget.ratingTitle,
                style: TextStyle(
                  color: Color.fromRGBO(31, 41, 55, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                widget.ratingBody,
                style: TextStyle(
                  color: Color.fromRGBO(75, 85, 99, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: GestureDetector(
                          onTap: () {
                            rating = 0;
                            setState(() {
                              stars.forEach((key, value) {
                                if (key <= index + 1) {
                                  rating++;
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
                            size: 40,
                          )),
                    );
                  }),
            ),
            MainAppButtonComponent(
              title: widget.submitText,
              onPressed: () {
                widget.onRate(rating);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
