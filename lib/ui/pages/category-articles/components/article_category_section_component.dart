import 'package:flutter/material.dart';

class ArticleCategorySectionComponent extends StatelessWidget {
  const ArticleCategorySectionComponent({
    super.key,
    required this.subCategoryTitle,
    required this.onTap,
    required this.viewMore,
  });

  final String subCategoryTitle;
  final Function() onTap;
  final String viewMore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 350,
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
          Image.asset(
            "assets/images/arrow_right_circled.png",
            width: 100,
            height: 100,
          ),
          Text(
            "$viewMore $subCategoryTitle",
            style: TextStyle(
              color: Color.fromRGBO(159, 75, 152, 1),
            ),
          ),
        ]),
      ),
    );
  }
}
