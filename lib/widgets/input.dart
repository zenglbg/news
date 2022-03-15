import 'package:flutter/material.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';

Widget inputTextEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool isPassword = false,
  double marginTop = 15,
  String? hintText,
}) {
  return Container(
    height: lbSetHeight(44),
    margin: EdgeInsets.only(top: lbSetHeight(marginTop)),
    decoration: BoxDecoration(
        color: AppColors.secondaryElement, borderRadius: Radii.k6pxRadius),
    child: TextField(
      controller: controller,
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword,
      style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w400,
          fontSize: lbSetFontSize(18)),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none),
    ),
  );
}
