import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HeadlineTwoTextWidget extends StatelessWidget {
  final String child;
  const HeadlineTwoTextWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    );
  }
}
