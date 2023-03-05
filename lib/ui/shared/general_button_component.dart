import 'package:flutter/material.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import '../../utils/constants.dart';

class MainAppButtonComponent extends StatelessWidget {
  const MainAppButtonComponent({
    super.key,
    required this.title,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.border,
  });

  final String title;
  final Function() onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ClickSound.soundClick();
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color ?? purpleColor,
          border: border,
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle ?? bold16TextStyle,
          ),
        ),
      ),
    );
  }
}
