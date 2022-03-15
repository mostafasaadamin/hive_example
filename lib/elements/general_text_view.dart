import 'package:flutter/material.dart';

class GeneralTextView extends StatelessWidget {
  String text;
  Color color;
  bool isBold;
  String fontFamily;
  double fontSize;
  bool overflow;
  GeneralTextView(
      {required this.text,
      required this.color,
      required this.isBold,
      required this.fontFamily,
      required this.fontSize,
      this.overflow = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ? TextOverflow.fade : TextOverflow.visible,
      style: TextStyle(
        color: color ,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: fontFamily,
        fontSize: fontSize,
      ),
    );
  }
}
