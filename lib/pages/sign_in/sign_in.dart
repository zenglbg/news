import 'package:flutter/material.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';
import 'package:news/widgets/widgets.dart';

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
          SizedBox(
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
                      boxShadow: const [Shadows.primaryShadow],
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
          inputTextEdit(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              isPassword: false),
          // pass
          inputTextEdit(
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true),
          // 登陆注册
          Container(
            height: lbSetHeight(44),
            margin: EdgeInsets.only(top: lbSetHeight(15)),
            child: Row(children: [
              btnFlatButtonWidget(onPressed: () {}, title: "Sign up"),
              const Spacer(),
              btnFlatButtonWidget(onPressed: _handleSignIn, title: "Sign 1 in"),
            ]),
          ),
          // forgot Password
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
            btnThirdSocialWidget(onPressed: () {}, fileName: 'twitter'),
            const Spacer(),
            btnThirdSocialWidget(onPressed: () {}, fileName: 'google'),
            const Spacer(),
            btnThirdSocialWidget(onPressed: () {}, fileName: 'facebook')
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
            shape:
                const RoundedRectangleBorder(borderRadius: Radii.k6pxRadius)),
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

  void _handleSignIn() {
    if (!lbIsEmail(emailController.value.text)) {
      toastInfo(msg: '请输入正确的邮件地址');
      return;
    }
    if (!lbCheckStringLength(passController.value.text, 6)) {
      toastInfo(msg: '密码长度不能低于6位');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          _buildLogo(),
          _buildInputForm(),
          const Spacer(),
          _buildThirdPartLogin(),
          _buildSignUpButton()
        ],
      )),
    );
  }
}
