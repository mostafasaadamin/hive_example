import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GeneralEditText extends StatelessWidget {
  String labelText;
  Color labelColor;
  Color hintColor;
  String hint;
  Color focusColor;
  Color borderColor;
  TextInputType textInput;
  IconData suffixIconData;
  Function() pickImage;
  Function(String? input) onSave;
  String? Function(String? input) validator;
  Function() onClick;
  TextEditingController controller;
  Color iconColor;
  bool showImagePlaceHolder;
  bool isEnabled;
  String fontFamily;
  int minLines = 1;
  Function() onIconTaped;
  GeneralEditText(
      {required this.labelText,
      required this.labelColor,
      required this.hintColor,
      required this.hint,
      required this.focusColor,
      required this.borderColor,
      required this.textInput,
      required this.suffixIconData,
      required this.pickImage,
      required this.onSave,
      required this.validator,
      required this.onClick,
      required this.controller,
      required this.iconColor,
      this.showImagePlaceHolder = false,
      this.isEnabled = true,
      required this.fontFamily,
      required this.minLines,
      required this.onIconTaped});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onClick,
      keyboardType: textInput,
      onSaved: onSave,
      controller: controller,
      minLines: minLines,
      maxLines: minLines,
      readOnly: !isEnabled,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setSp(13)),
        constraints: BoxConstraints(
            minHeight: ScreenUtil().setHeight(49),
            maxWidth: ScreenUtil().setHeight(305)),
        contentPadding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(16),
            horizontal: ScreenUtil().setWidth(13)),
        hintText: hint,
        hintStyle: TextStyle(
            color: hintColor,
            fontFamily: fontFamily,
            fontSize: ScreenUtil().setSp(13)),
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: focusColor)),
        suffixIcon: showImagePlaceHolder
            ? const SizedBox(
                width: 15, height: 15, child: CircularProgressIndicator())
            : GestureDetector(
                onTap: onIconTaped,
                child: IconButton(
                  onPressed: pickImage,
                  color: iconColor,
                  icon: Icon(
                    suffixIconData,
                  ),
                ),
              ),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
      ),
    );
  }
}
