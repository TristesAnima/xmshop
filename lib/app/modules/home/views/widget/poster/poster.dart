import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 广告牌
class Poster extends GetView<HomeController> {
  const Poster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
          ScreenAdapter.width(10), ScreenAdapter.width(20), 0),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/xiaomiBanner2.png'))),
      ),
    );
  }
}
