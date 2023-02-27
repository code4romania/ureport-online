import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';

Widget submitButton({
  required String type,
  required Function() onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    margin: EdgeInsets.only(left: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: type == 'google'
            ? Colors.white
            : type == 'facebook'
                ? Colors.white
                : type == 'apple'
                    ? Colors.black
                    : Color.fromRGBO(68, 151, 223, 1),
        foregroundColor: type == 'google' ? Colors.black : Colors.white,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          type == 'login' || type == 'register'
              ? SizedBox()
              : Image(
                  image: AssetImage(type == "google"
                      ? 'assets/images/google-logo.png'
                      : type == "facebook"
                          ? 'assets/images/facebook-logo.png'
                          : 'assets/images/apple-logo.png'),
                  height: 18.0,
                ),
        ],
      ),
    ),
  );
}

Widget textField({
  required String label,
  required TextEditingController controller,
  String? errorText,
  required bool obscureText,
  required TextInputType keyboardType,
  required TextInputAction textInputAction,
}) {
  return Container(
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.only(right: 30, left: 30, top: 10),
    child: Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )),
        Theme(
          data: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.grey,
            selectionHandleColor: Colors.black,
          )),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            cursorColor: Colors.black,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: purpleColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void showPopup(
    {required BuildContext context,
    String? type,
    required String message,
    required Function() onPressed,
    required String buttonText}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('U-Report'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(68, 151, 223, 1),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}
