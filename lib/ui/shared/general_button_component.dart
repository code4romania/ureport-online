import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class MainAppButtonComponent extends StatelessWidget {
  const MainAppButtonComponent({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: purpleColor,
        ),
        child: Center(
          child: Text(
            title,
            style: bold16TextStyle,
          ),
        ),
      ),
    );
  }
}
