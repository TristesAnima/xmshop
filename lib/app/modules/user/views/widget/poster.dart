import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class UserPoster extends GetView {
  const UserPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return //广告
        Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
      child: Container(
        width: ScreenAdapter.width(1008),
        height: ScreenAdapter.height(300),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/user_ad1.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
      ),
    );
  }
}
