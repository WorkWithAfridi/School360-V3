import 'package:flutter/material.dart';

class ButtonLoadingAnimation extends StatelessWidget {
  final Color loadingColor;
  const ButtonLoadingAnimation({Key? key, required this.loadingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: loadingColor,
      ),
    );
  }
}
