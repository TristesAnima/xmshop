import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 轮播图下面分类
class BannerBottom extends GetView<HomeController> {
  const BannerBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        'assets/images/xiaomiBanner.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
