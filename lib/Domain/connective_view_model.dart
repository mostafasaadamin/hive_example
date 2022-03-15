import 'dart:io';
import 'package:hive_example/Helper/colors.dart';
import 'package:hive_example/elements/general_button.dart';
import 'package:hive_example/elements/general_text_view.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Connection
{
  static final _instance = Connection._internal();
  Connection._internal();
  static Connection getInstance() {
    return _instance;
  }

  void checkInternetConnection(BuildContext context)async{
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      }
    } on SocketException catch (_) {
      showNoInternetDialog(context);
    }
  }

  static showNoInternetDialog(
      BuildContext context) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Stack(
            children: [
              AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                contentPadding: EdgeInsets.only(top: 2.0),
                content: SizedBox(
                  // height: ScreenUtil().setHeight(260),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(10),
                            right: ScreenUtil().setWidth(10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset('assets/wifi.json',
                                    width: ScreenUtil().setWidth(100),
                                    height: ScreenUtil().setHeight(100),
                                    fit: BoxFit.contain),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    GeneralTextView(
                                      color: Color(0xff20154B),
                                      fontSize: 15.sp,
                                      isBold: false,
                                      fontFamily: "din",
                                      text: "انت غير متصل حاليا الرجاء ",
                                      overflow: false,
                                    ),
                                  ],
                                ),
                                SizedBox(height:2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GeneralTextView(
                                      color: Color(0xff20154B),
                                      fontSize: 15.sp,
                                      isBold: false,
                                      fontFamily: "din",
                                      text: "التحقق من الانترنت ",
                                      overflow: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  GeneralButton(
                                    text: "موافق",
                                    bottomPadding: 8.h,
                                    btnColor: const [textColor2, textColor2],
                                    leftPadding: 80.w,
                                    onPressed: () {
Navigator.of(context).pop();
                                    },
                                    rightPadding: 80.w,
                                    shadowColor: Colors.white,
                                    textColor: Colors.white,
                                    textSize: 16.sp,
                                    topPadding: 8.h,
                                    showLoading: false,
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}