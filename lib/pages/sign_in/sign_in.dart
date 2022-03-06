import 'package:flutter/material.dart';
import 'package:news/pages/sign_in/button_widget.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Widget _buildLogo() {
    return Container(
      width: lbSetWidth(110),
      margin: EdgeInsets.only(top: lbSetHeight(40 + 44.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: lbSetHeight(76),
            width: lbSetWidth(76),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    child: Container(
                  height: lbSetHeight(76),
                  decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [Shadows.primaryShadow],
                      borderRadius: BorderRadius.all(
                          Radius.circular(lbSetWidth(76 * .5)))),
                  child: Container(),
                )),
                Positioned(
                    top: lbSetWidth(13),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.none,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInputForm() {
    return Container(
      width: lbSetWidth(295),
      margin: EdgeInsets.only(top: lbSetWidth(49)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // email
          Container(
            height: lbSetHeight(44),
            decoration: BoxDecoration(
                color: AppColors.secondaryElement,
                borderRadius: Radii.k6pxRadius),
            child: TextField(
              controller: emailController,
              maxLines: 1,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: lbSetFontSize(18)),
              autocorrect: false, // 自动纠正
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                  border: InputBorder.none),
            ),
          ),
          // pass
          Container(
            height: lbSetHeight(44),
            margin: EdgeInsets.only(top: lbSetHeight(15)),
            decoration: BoxDecoration(
                color: AppColors.secondaryElement,
                borderRadius: Radii.k6pxRadius),
            child: TextField(
              controller: passController,
              maxLines: 1,
              autocorrect: false, // 自动纠正
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: lbSetFontSize(18)),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                  border: InputBorder.none),
            ),
          ),
          // 登陆注册
          Container(
            height: lbSetHeight(44),
            margin: EdgeInsets.only(top: lbSetHeight(15)),
            child: Row(children: [
              Container(
                  width: lbSetWidth(140),
                  height: lbSetHeight(44),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: Radii.k6pxRadius),
                          primary: AppColors.primaryElement),
                      child: Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryElementText,
                            fontSize: lbSetFontSize(18)),
                      ))),
              Spacer(),
              Container(
                  width: lbSetWidth(140),
                  height: lbSetHeight(44),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: Radii.k6pxRadius),
                          primary: AppColors.primaryElement),
                      child: Text(
                        "Sign in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.primaryElementText,
                            fontSize: lbSetFontSize(18)),
                      ))),
            ]),
          )

          // forgot Password
          ,
          Container(
            height: lbSetHeight(22),
            margin: EdgeInsets.only(top: lbSetHeight(20)),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'forgot password?',
                style: TextStyle(
                    color: AppColors.secondaryElementText,
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w400,
                    fontSize: lbSetFontSize(16),
                    height: 1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildThirdPartLogin() {
    return Container(
      width: lbSetWidth(295),
      margin: EdgeInsets.only(bottom: lbSetHeight(40)),
      child: Column(children: [
        Text(
          'Or sign in with social networks',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: lbSetFontSize(16)),
        ),
        Padding(
          padding: EdgeInsets.only(top: lbSetHeight(20)),
          child: Row(children: [
            btnThirdSocialWidget('twitter'),
            Spacer(),
            btnThirdSocialWidget('google'),
            Spacer(),
            btnThirdSocialWidget('facebook')
          ]),
        )
      ]),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      width: lbSetWidth(295),
      height: lbSetHeight(44),
      margin: EdgeInsets.only(bottom: lbSetHeight(20)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.secondaryElement,
            shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius)),
        child: Text(
          'Sign up',
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: lbSetFontSize(16),
            height: 1,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/sign-up');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          _buildLogo(),
          _buildInputForm(),
          Spacer(),
          _buildThirdPartLogin(),
          _buildSignUpButton()
        ],
      )),
    );
  }
}
