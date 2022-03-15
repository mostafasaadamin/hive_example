import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralButton extends StatelessWidget {
  String text;
  List<Color> btnColor;
  Color textColor;
  Color shadowColor;
  double textSize;
  Function() onPressed;
  double leftPadding;
  double rightPadding;
  double bottomPadding;
  double topPadding;
  bool showLoading;

  GeneralButton(
      {required this.text,
      required this.btnColor,
      required this.textColor,
      required this.shadowColor,
      required this.textSize,
      required  this.onPressed,
      required this.leftPadding,
      required this.rightPadding,
      required this.bottomPadding,
      required this.topPadding,
      this.showLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 20,
                ),
              ],
              gradient: LinearGradient(colors: btnColor),
              borderRadius: const BorderRadius.all(Radius.circular(28.0))),
          child: Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(leftPadding ),
                right: ScreenUtil().setWidth(rightPadding),
                top: ScreenUtil().setHeight(topPadding ),
                bottom: ScreenUtil().setHeight(bottomPadding)),
            child: !showLoading
                ? Text(text,
                    style: TextStyle(fontSize: textSize, color: textColor))
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
          )),
    );
  }
}
