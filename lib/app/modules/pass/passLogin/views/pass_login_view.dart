import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/logo.dart';
import 'package:xmshop/app/common/passButton.dart';
import 'package:xmshop/app/common/passTextField.dart';
import 'package:xmshop/app/common/userAgreement.dart';
import '../../../../services/screenAdapter.dart';
import '../controllers/pass_login_controller.dart';

class PassLoginView extends GetView<PassLoginController> {
  const PassLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [TextButton(onPressed: () {}, child: const Text("帮助"))],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          const Logo(),
          //输入手机号
          PassTextFiled(hintText: "请输入手机号", onChanged: (value) {}),

          PassTextFiled(hintText: "请输入密码", onChanged: (value) {}),
          //用户协议
          const UserAgreement(),
          //登录按钮
          PassButton(
              text: "获取验证码",
              onPressed: () {
                Get.toNamed("/code-login-step-two");
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: const Text("忘记密码")),
              TextButton(onPressed: () {}, child: const Text("验证码登录"))
            ],
          )
        ],
      ),
    );
  }
}
