import 'package:flutter/material.dart';
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({
    Key? key,
    required this.bookmarkItem,
    required this.isLastItem,
  }) : super(key: key);
  final Bookmark bookmarkItem;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    // String creationDate = "";
    String bookmarkImageUrl = "";

    if (bookmarkItem.story?.created_on != null)
    // creationDate =
    //     DateFormat("dd-MM-yyyy").format(bookmarkItem.story!.created_on!);

    if (bookmarkItem.story?.images != null &&
        bookmarkItem.story!.images!.isNotEmpty) {
      bookmarkImageUrl = bookmarkItem.story!.images![0];
    }

    return Container(
      margin: isLastItem
          ? EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 40,
            )
          : EdgeInsets.all(10),
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            bookmarkItem.story?.title ?? "",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 30,
              height: 30,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: Offset(-8, 8),
                  spreadRadius: -3,
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                )
              ]),
              child: CachedImageComponent(
                imageUrl: bookmarkImageUrl,
              ),
            ),
            Expanded(
                child: Text(
              "Category",
            )),
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
