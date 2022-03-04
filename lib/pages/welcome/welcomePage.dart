import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Widget _buildPageheadTitle() {
    return Container(
      margin: EdgeInsets.only(top: lbSetHeight(65)),
      child: Text(
        'Features',
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: lbSetFontSize(24)),
      ),
    );
  }

  Widget _buildPageHeaderDetail() {
    return Container(
      width: lbSetWidth(242),
      height: lbSetHeight(70),
      margin: EdgeInsets.only(top: lbSetHeight(14)),
      child: Text(
        "The best of news channels all in one place. Trusted sources and personalized news for you.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
            fontSize: lbSetFontSize(16),
            height: 1.3),
      ),
    );
  }

  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: 295.w,
      height: 80.h,
      margin: EdgeInsets.only(top: marginTop.h),
      child: Row(children: [
        Container(
          child: Image.asset(
            'assets/images/$imageName.png',
            fit: BoxFit.none,
          ),
        ),
        Spacer(),
        Container(
          width: 195.w,
          child: Text(
            intro,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: lbSetFontSize(16)),
          ),
        )
      ]),
    );
  }

  /// 开始按钮
  Widget _buildStartButton() {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text("Get started"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      context: context,
      designSize: Size(375.0, 812.0 - 44.0 - 34.0),
    );

    return Scaffold(
      key: Key('_WelcomePageState'),
      body: Center(
          child: Column(
        children: [
          _buildPageheadTitle(),
          _buildPageHeaderDetail(),
          _buildFeatureItem(
              'feature-1',
              "Compelling photography and typography provide a beautiful reading",
              86),
          _buildStartButton()
        ],
      )),
    );
  }
}
