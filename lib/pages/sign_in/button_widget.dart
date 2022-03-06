import 'package:flutter/material.dart';
import 'package:news/utils/utils.dart';

Widget btnThirdSocialWidget(String fileName) {
  return Container(
      width: lbSetWidth(88),
      height: lbSetHeight(44),
      child: InkWell(
        onTap: () {},
        child: Image.asset(
          "assets/images/icons-$fileName.png",
        ),
      ));
}
