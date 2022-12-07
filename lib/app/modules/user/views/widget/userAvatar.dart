import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 用户头像 登录注册
class UserAvatar extends GetView {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: ScreenAdapter.width(40)),
          SizedBox(
            height: ScreenAdapter.height(150),
            width: ScreenAdapter.height(150),
            child: CircleAvatar(
              radius: ScreenAdapter.width(75),
              backgroundImage: const AssetImage("assets/images/user.png"),
            ),
          ),
          SizedBox(width: ScreenAdapter.width(40)),
          InkWell(
            onTap: () {
              Get.toNamed("/code-login-step-one");
            },
            child:
                Text("登录/注册", style: TextStyle(fontSize: ScreenAdapter.fs(46))),
          ),
          SizedBox(width: ScreenAdapter.width(40)),
          Icon(
            Icons.arrow_forward_ios,
            size: ScreenAdapter.fs(34),
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
