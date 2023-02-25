import 'package:flutter/material.dart';

class TopHeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopHeaderWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      iconTheme: IconThemeData(color: Colors.black),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  "assets/images/ureport_romania_landscape.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/vector.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'Heebo'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
