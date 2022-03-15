
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_details.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool once = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void initState() {
    Timer(Duration(seconds: 4),
            () => {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomeDetails()), (Route<dynamic> route) => false),
        });
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            child: Image.asset(
              'assets/ultimate.jpg',
              fit: BoxFit.fill,
              width: 300.w,
              height:300.h,
            ),
          ),
        ),
      );
    }
  }
