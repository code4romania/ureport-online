import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class ArticleHeaderComponent extends StatelessWidget {
  const ArticleHeaderComponent({
    super.key,
    required this.storyId,
    required this.title,
    required this.categoryName,
    required this.author,
    required this.authorValue,
    required this.date,
    required this.dateValue,
    required this.isBookmarked,
    required this.onShare,
    required this.onBookmark,
  });

  final int storyId;
  final String title;
  final String categoryName;
  final String author;
  final String authorValue;
  final String date;
  final DateTime dateValue;
  final bool isBookmarked;
  final Function() onShare;
  final Function() onBookmark;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Color.fromRGBO(201, 13, 182, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onBookmark,
                    child: Icon(
                      isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      color: purpleColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: onShare,
                    child: Icon(
                      Icons.share_outlined,
                      color: purpleColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Text(
            title,
            style: TextStyle(
                fontSize: title.length > 60 ? 15 : 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: purpleColor),
                  ),
                  Text(
                    authorValue,
                    style: TextStyle(color: purpleColor),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: purpleColor),
                  ),
                  Text(formatter.format(dateValue),
                      style: TextStyle(
                        color: purpleColor,
                      ))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
