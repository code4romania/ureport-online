import 'package:flutter/material.dart';

class ArticleCategorySectionComponent extends StatelessWidget {
  const ArticleCategorySectionComponent({
    super.key,
    required this.categoryTitle,
    required this.onTap,
  });

  final String categoryTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        margin: EdgeInsets.only(
          top: 20,
          left: 10,
          bottom: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(8, 8),
              spreadRadius: 2,
              blurRadius: 5,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.arrow_circle_right_outlined,
            size: 100,
            color: Color.fromRGBO(159, 75, 152, 1),
          ),
          Text(
            "Vezi mai multe articole din categoria $categoryTitle",
            style: TextStyle(
              color: Color.fromRGBO(159, 75, 152, 1),
            ),
          ),
        ]),
      ),
    );
  }
}
