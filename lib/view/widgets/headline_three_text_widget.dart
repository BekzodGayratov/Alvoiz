import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeadlineThreeTextWidget extends StatelessWidget {
  final String child;
  const HeadlineThreeTextWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          color: Colors.white),
    );
  }
}
