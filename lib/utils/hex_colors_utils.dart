import 'package:flutter/material.dart';

class HexColor extends Color {
  static Color selectedChoiceColor = HexColor("#312E81");
  static Color secondaryChoiceColor = HexColor("#4338CA");
  static Color secondaryPurpleChoiceColor = HexColor("#4F46E5");

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
