import 'package:flutter/material.dart';

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
