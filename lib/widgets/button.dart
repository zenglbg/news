import 'package:flutter/material.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';

Widget btnFlatButtonWidget(
    {required VoidCallback onPressed,
    double width = 140,
    double height = 44,
    Color gbColor = AppColors.primaryElement,
    String title = 'Button',
    Color fontColor = AppColors.primaryElementText,
    double fontSize = 18,
    String fontName = 'Montserrat',
    FontWeight fontWeight = FontWeight.w400}) {
  return SizedBox(
      width: lbSetWidth(width),
      height: lbSetHeight(height),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape:
                  const RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
              primary: gbColor),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: fontColor,
                fontSize: lbSetFontSize(fontSize),
                fontFamily: fontName,
                fontWeight: fontWeight),
          )));
}

Widget btnThirdSocialWidget(
    {required VoidCallback onPressed,
    double width = 88,
    double height = 44,
    String? fileName}) {
  return SizedBox(
      width: lbSetWidth(width),
      height: lbSetHeight(height),
      child: InkWell(
        onTap: onPressed,
        child: Image.asset(
          "assets/images/icons-$fileName.png",
        ),
      ));
}
