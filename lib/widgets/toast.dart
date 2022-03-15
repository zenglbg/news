import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/utils/utils.dart';

Future<bool?> toastInfo(
    {required String msg,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white}) async {
  return await Fluttertoast.showToast(
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      fontSize: lbSetFontSize(16),
      msg: msg,
      backgroundColor: backgroundColor,
      textColor: textColor);
}
