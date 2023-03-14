import 'package:flutter/material.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';

class MedalWidget extends StatelessWidget {
  const MedalWidget({
    Key? key,
    required this.medal,
    required this.isLastItem,
  }) : super(key: key);
  final BadgeMedal medal;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isLastItem
          ? EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 40,
            )
          : EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 100,
                height: 100,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    offset: Offset(-8, 8),
                    spreadRadius: -3,
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  )
                ]),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.network(
                    medal.badge_type!.image.toString(),
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text("Image not found"),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      medal.badge_type?.title ?? "",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      medal.badge_type?.description ?? "",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.6,
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
                ],
              )
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
        ],
      ),
    );
  }
}
