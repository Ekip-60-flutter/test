import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  int? maxLines;
  double? fontSize;
  double? minFontSize;
  double? maxFontSize;
  double? letterSpacing;
  double? wordSpacing;
  TextOverflow? textOverFlow;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextDecoration? textDecoration;
  CustomText({
    this.text,
    this.maxLines,
    this.fontSize,
    this.minFontSize,
    this.maxFontSize,
    this.textOverFlow,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.letterSpacing,
    this.wordSpacing,
    this.fontStyle,
    this.textDecoration
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: TextStyle(
        fontSize: fontSize??16,
        color: color??Colors.black,
        fontWeight: fontWeight??FontWeight.normal,
        letterSpacing: letterSpacing??1.2,
        wordSpacing: wordSpacing??5,
        fontStyle: fontStyle??FontStyle.normal,
        decoration: textDecoration??TextDecoration.none
      ),
      textAlign: textAlign??TextAlign.center,
      maxLines: maxLines??1,
      //maxFontSize: maxFontSize??30,
      //minFontSize: minFontSize??11,
      overflow: textOverFlow??TextOverflow.ellipsis
    );
  }
}