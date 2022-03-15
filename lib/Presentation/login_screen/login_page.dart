import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_example/Data/Models/user.dart';
import 'package:hive_example/Domain/use_cases/hive_operation.dart';
import 'package:hive_example/Helper/colors.dart';
import 'package:hive_example/Helper/validator.dart';
import 'package:hive_example/elements/general_button.dart';
import 'package:hive_example/elements/general_edit_text.dart';
import 'package:hive_example/elements/general_text_view.dart';
import 'package:provider/provider.dart';

import '../home_details.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  bool showPassword = true;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController.text = "01225253408";
    passwordController.text = "123456";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .99,
          child: Stack(
            children: [
              Positioned(
                right: ScreenUtil().setWidth(9.75),
                top: ScreenUtil().setWidth(89.44),
                left: ScreenUtil().setWidth(9.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GeneralTextView(
                      color: Color(0xff20154B),
                      fontSize: 25.sp,
                      isBold: false,
                      fontFamily: "din",
                      text: "Ultimate Solution",
                      overflow: false,
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: ScreenUtil().setWidth(20.5),
                  right: ScreenUtil().setWidth(20.5),
                  top: ScreenUtil().setHeight(208.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Welcome On ",
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(20),
                                          fontFamily: "dinBold",
                                          color: Color(0xff20154B)),
                                    ),
                                    TextSpan(
                                        text: "Ultimate Solution",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20),
                                            fontFamily: "din",
                                            color: Color(0xff1CADD3))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(7),
                      ),
                      GeneralTextView(
                        color: Color(0xff9F9F9F),
                        fontSize: 13.sp,
                        isBold: false,
                        fontFamily: "din",
                        text:
                            "الرجاء ادخال رقم الهاتف والباسورد لاتمام التسجيل",
                        overflow: false,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(41),
                      ),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            GeneralEditText(
                              labelText: "رقم الهاتف",
                              fontFamily: "dinmedium",
                              hint: "01*********",
                              labelColor: eitTextColor,
                              controller: phoneController,
                              borderColor: textColor,
                              focusColor: textColor2,
                              hintColor: textColor,
                              iconColor: Colors.grey,
                              onIconTaped: () {},
                              minLines: 1,
                              onSave: (value) {},
                              onClick: () {},
                              pickImage: () {},
                              suffixIconData: Icons.phone,
                              textInput: TextInputType.phone,
                              validator: (input) {
                                return !Validator.isValidPhone(input)
                                    ? "phone required"
                                    : null;
                              },
                              isEnabled: true,
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(35),
                            ),
                            GeneralEditText(
                              labelText: "الرقم السري",
                              fontFamily: "dinmedium",
                              hint: "*********",
                              labelColor: eitTextColor,
                              controller: passwordController,
                              borderColor: textColor,
                              focusColor: textColor2,
                              hintColor: textColor,
                              iconColor: Colors.grey,
                              onIconTaped: () {},
                              minLines: 1,
                              onSave: (value) {},
                              onClick: () {},
                              pickImage: () {},
                              suffixIconData: Icons.phone,
                              textInput: TextInputType.phone,
                              validator: (input) {
                                return !Validator.isValidPassword(input)
                                    ? "الرقم السري مطلوب"
                                    : null;
                              },
                              isEnabled: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(13),
                      ),
                      GeneralButton(
                        text: "تسجيل الدخول",
                        bottomPadding: 16.h,
                        btnColor: const [textColor2, textColor2],
                        leftPadding: 80.w,
                        onPressed: () {
                          loginProcess();
                        },
                        rightPadding: 80.w,
                        shadowColor: Colors.white,
                        textColor: Colors.white,
                        textSize: 16.sp,
                        topPadding: 16.h,
                        showLoading: false,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void loginProcess() async {
    if (phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        _formKey.currentState!.validate()) {
      ///login from hive Screen
      User user = HiveOperations.getInstance().getUser();
      if (user.phone == phoneController.text &&
          user.password == passwordController.text) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeDetails()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("من فضلك تأكد من الايميل والباس ورد الخاصين بك"),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
