import 'package:flutter/material.dart';

class CustomLoadingAnimation extends StatelessWidget {
  final Color loadingColor;
  const CustomLoadingAnimation({Key? key, required this.loadingColor})
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
