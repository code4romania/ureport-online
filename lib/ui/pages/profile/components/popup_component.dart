import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';

class PopupComponent extends AlertDialog {
  const PopupComponent(
    this.titleText,
    this.iconData,
    this.bodyText, {
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String titleText;
  final IconData iconData;
  final String bodyText;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 25,
      ),
      contentPadding: EdgeInsets.only(
        left: 18,
        right: 18,
        bottom: 25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(209, 250, 229, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              iconData,
              color: Color.fromRGBO(5, 150, 105, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            titleText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            bodyText,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          MainAppButtonComponent(
            title: buttonText,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
