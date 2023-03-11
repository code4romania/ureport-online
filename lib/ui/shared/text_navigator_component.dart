import 'package:flutter/material.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';

class TextNavigatorComponent extends StatelessWidget {
  const TextNavigatorComponent({
    super.key,
    required this.title,
    required this.onPressed,
    required this.rightEdge,
    this.darkMode,
  });

  final String title;
  final Function() onPressed;
  final bool rightEdge;
  final bool? darkMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ClickSound.soundClose();
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            rightEdge ? const Spacer() : Container(),
            if (!rightEdge)
              Container(
                height: 30,
                child: Text("< ",
                    style: TextStyle(
                      fontSize: 22,
                      color: darkMode != null ? Colors.white : Colors.black,
                    )),
              ),
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: darkMode != null ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
