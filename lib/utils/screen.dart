import 'package:flutter_screenutil/flutter_screenutil.dart';

/*
  ScreenUtil.pixelRatio       //设备的像素密度
    ScreenUtil.screenWidth      //设备宽度
    ScreenUtil.screenHeight     //设备高度
    ScreenUtil.bottomBarHeight  //底部安全区距离，适用于全面屏下面有按键的
    ScreenUtil.statusBarHeight  //状态栏高度 刘海屏会更高  单位px
    ScreenUtil.textScaleFactor //系统字体缩放比例
    
    ScreenUtil().scaleWidth  // 实际宽度的dp与设计稿px的比例
    ScreenUtil().scaleHeight // 实际高度的dp与设计稿px的比例
*/

double lbSetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double lbSetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double lbSetFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
