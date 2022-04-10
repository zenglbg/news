import 'package:flutter/material.dart';
import 'package:news/utils/utils.dart';
import 'package:news/values/values.dart';
import 'package:news/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget _buildLogo() {
    return Container();
  }

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // 执行注册操作
  _handleSignUp() {
    if (!lbCheckStringLength(_fullnameController.value.text, 5)) {
      toastInfo(msg: '用户名不能小于5位');
      return;
    }
    if (!lbIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!lbCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
    Navigator.pop(context);
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      width: lbSetWidth(295),
      child: Column(children: [
        inputTextEdit(
            controller: _fullnameController,
            keyboardType: TextInputType.text,
            hintText: 'Full name'),
        inputTextEdit(
            controller: _emailController,
            keyboardType: TextInputType.text,
            hintText: 'Email'),
        inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.text,
            hintText: 'Password'),
        Container(
          height: lbSetHeight(44),
          margin: EdgeInsets.only(top: lbSetHeight(15)),
          child: btnFlatButtonWidget(
              onPressed: () {
                if (!lbCheckStringLength(_fullnameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能小于5');
                  return;
                }
                if (!lbIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请正确输入邮件');
                  return;
                }
                if (!lbCheckStringLength(_passController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6');
                  return;
                }

                Navigator.pop(context);
              },
              width: 295,
              fontWeight: FontWeight.w600,
              title: "Create an account"),
        ),
        Container(
          // height: lbSetHeight(22),
          margin: EdgeInsets.only(top: lbSetHeight(20)),
          child: TextButton(
              onPressed: _handleSignUp,
              child: Text(
                'Fogot Password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: lbSetFontSize(16),
                  height: 1,
                ),
              )),
        )
      ]),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: lbSetWidth(295),
      margin: EdgeInsets.only(bottom: lbSetHeight(40)),
      child: Column(children: [
        Text(
          'Or sign in with social network',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: lbSetFontSize(16)),
        ),
        Padding(
          padding: EdgeInsets.only(top: lbSetHeight(20)),
          child: Row(children: [
            btnThirdSocialWidget(onPressed: () {}, fileName: 'twitter'),
            Spacer(),
            btnThirdSocialWidget(onPressed: () {}, fileName: 'google'),
            Spacer(),
            btnThirdSocialWidget(onPressed: () {}, fileName: 'facebook')
          ]),
        )
      ]),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: lbSetHeight(20)),
      child: btnFlatButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
          width: lbSetWidth(295),
          gbColor: AppColors.secondaryElement,
          fontColor: AppColors.primaryText,
          title: 'I have an acount!',
          fontWeight: FontWeight.w500,
          fontSize: lbSetFontSize(16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(context: context, actions: [
        IconButton(
          icon: Icon(
            Icons.info_outline,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            toastInfo(msg: '这是注册界面');
          },
        )
      ]),
      body: Center(
          child: Column(
        children: [
          Divider(
            height: 1,
          ),
          _buildLogo(),
          _buildInputForm(),
          Spacer(),
          _buildThirdPartyLogin(),
          _buildHaveAccountButton()
        ],
      )),
    );
  }
}
