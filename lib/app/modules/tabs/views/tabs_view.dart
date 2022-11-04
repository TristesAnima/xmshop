import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            // 配置左右滑动
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              // 滑动
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            iconSize: 17,
            fixedColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              // 点击
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: "用户")
            ],
          ),
        ));
  }
}
