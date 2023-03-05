import 'package:flutter/material.dart';

class CustomLinearIndicator extends StatelessWidget {
  const CustomLinearIndicator({
    super.key,
    required this.percent,
    required this.color,
    required this.label,
  });

  final double percent;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LinearProgressIndicator(
          minHeight: 28.0,
          backgroundColor: Colors.white,
          value: percent,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
