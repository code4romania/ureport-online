import 'package:flutter/material.dart';

class TextNavigatorComponent extends StatelessWidget {
  const TextNavigatorComponent({
    super.key,
    required this.title,
    required this.onPressed,
    required this.rightEdge,
  });

  final String title;
  final Function() onPressed;
  final bool rightEdge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          rightEdge ? const Spacer() : Container(),
          Container(
            child: GestureDetector(
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  height: 1.2,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
