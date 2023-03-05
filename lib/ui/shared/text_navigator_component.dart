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
        ClickSound.soundClick();
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            rightEdge ? const Spacer() : Container(),
            if (!rightEdge)
              Text("< ",
                  style: TextStyle(
                    fontSize: 22,
                    color: darkMode != null ? Colors.white : Colors.black,
                  )),
            Container(
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
