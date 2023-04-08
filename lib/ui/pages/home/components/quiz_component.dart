import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class QuizComponent extends StatelessWidget {
  const QuizComponent({super.key, required this.translation});

  final Map<String, String> translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/icon_quiz.svg",
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation["new_quiz"]!,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    translation["complete_now"]!,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 60),
              SizedBox(
                width: 70,
                height: 80,
                child: MainAppButtonComponent(
                  title: translation["yes"]!,
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 100,
                height: 80,
                child: MainAppButtonComponent(
                  color: Colors.white,
                  textStyle: TextStyle(color: Colors.grey[600]),
                  border: Border.all(color: Colors.grey[600]!),
                  title: translation["snooze"]!,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
