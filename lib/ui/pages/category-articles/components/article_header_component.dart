// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:share/share.dart';
// import 'package:ureport_ecaro/services/click_sound_service.dart';
// import 'package:ureport_ecaro/utils/constants.dart';

// class ArticleHeaderComponent extends StatelessWidget {
//   const ArticleHeaderComponent({super.key, required this.storyId, required this.title, required this.categoryName, required this.author, required this.authorValue, required this.date, required this.dateValue, required this.isBookmarked, required this.onBookmark,});

//   final int storyId;
//   final String title;
//   final String categoryName;
//   final String author;
//   final String authorValue;
//   final String date;
//   final DateTime dateValue;
//   final bool isBookmarked;
//   final Function(bool) onBookmark;

//   @override
//   Widget build(BuildContext context) {
//       final DateFormat formatter = DateFormat('dd/MM/yyyy');

//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(left: 20, right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 4,
//                     backgroundColor: Color.fromRGBO(201, 13, 182, 1),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     categoryName,
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       ClickSound.soundClick();

//                       if (isBookmarked) {
//                         onBookmark(false);
//                         // _storyStore.removeBookmark(
//                         //   storyId: widget.preloadedStory!.id!,
//                         // );
//                       } else {
//                         onBookmark(true);
//                         // _storyStore.addBookmark(
//                         //   storyId: widget.preloadedStory!.id!,
//                         // );
//                       }

//                       // call api to bookmark story
//                     },
//                     child: Icon(
//                         isBookmarked
//                             ? Icons.bookmark
//                             : Icons.bookmark_border_outlined,
//                         color: purpleColor,
//                         size: 30,
//                       ),
                    
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       ClickSound.soundShare();
//                       Share.share(
//                           shareStoryUrl +
//                               "/" +
//                               storyId.toString(),
//                           subject: title,);
//                     },
//                     child: Icon(
//                       Icons.share_outlined,
//                       color: purpleColor,
//                       size: 30,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.only(top: 10, left: 20, right: 20),
//           child: Text(
//           title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//           ),
//         )
       

            
          
        
  
// }