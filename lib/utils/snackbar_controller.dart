import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class SnackbarController {
  final BuildContext context;
  final String message;

  late SnackBar _snackBar;

  SnackbarController({
    required this.context,
    required this.message,
  }) {
    _snackBar = SnackBar(
      content: Text(message),
      backgroundColor: blueColor,
    );
  }

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}
