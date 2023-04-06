import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingIndicatorComponent extends StatelessWidget {
  const LoadingIndicatorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Center(
          child: Image.asset(
        "assets/gifs/loading.gif",
      )),
    );
  }
}
