import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class ArticleHeaderComponent extends StatelessWidget {
  const ArticleHeaderComponent({
    super.key,
    required this.storyId,
    required this.isBookmarked,
    required this.onShare,
    required this.onBookmark,
  });

  final int storyId;
  final bool isBookmarked;
  final Function() onShare;
  final Function() onBookmark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBookmark,
          child: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border_outlined,
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
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
