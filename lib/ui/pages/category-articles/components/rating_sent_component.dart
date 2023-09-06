import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class RatingSentComponent extends StatelessWidget {
  const RatingSentComponent({
    super.key,
    required this.translation,
    required this.onClose,
  });

  final Map<String, String> translation;
  final Function onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.router.pop();
                onClose();
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
            Text(
              translation["rating_sent_title"]!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(31, 41, 55, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              translation["rating_sent_body"]!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(75, 85, 99, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
