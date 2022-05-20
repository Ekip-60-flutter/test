import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  String text;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  MyText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: 1.7,
          color: color ?? Colors.white,
          fontFamily: 'PatrickHand'),
    );
  }
}
