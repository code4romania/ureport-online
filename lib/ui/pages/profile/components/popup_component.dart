import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/shared/general_button_component.dart';

class PopupComponent extends AlertDialog {
  const PopupComponent(
    this.titleText,
    this.iconData,
    this.iconBackgroundColor,
    this.iconColor,
    this.bodyText,
    this.confirmButtonText,
    this.onPressConfirm,
    this.backButtonText,
    this.onPressBack,
  );

  final String titleText;
  final IconData iconData;
  final Color iconBackgroundColor;
  final Color iconColor;
  final String bodyText;
  final String confirmButtonText;
  final Function() onPressConfirm;
  final String? backButtonText;
  final Function()? onPressBack;

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
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              iconData,
              color: iconColor,
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
            title: confirmButtonText,
            onPressed: onPressConfirm,
          ),
          backButtonText != null
              ? MainAppButtonComponent(
                  title: backButtonText!,
                  onPressed: onPressBack!,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
