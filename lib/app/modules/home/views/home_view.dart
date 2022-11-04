import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/views/widget/appBar.dart';
import 'package:xmshop/app/modules/home/views/widget/homeBody.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: const [
        /// 内容
        HomeBody(),
        HomeAppBar(),
      ],
    ));
  }
}
