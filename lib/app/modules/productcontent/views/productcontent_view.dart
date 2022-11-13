import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/appBar/appBar.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/bottomBar/bottomBar.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/content.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/productcontent_controller.dart';

class ProductcontentView extends GetView<ProductcontentController> {
  const ProductcontentView({Key? key}) : super(key: key);

  Widget subHeader() {
    return Container(
        color: Colors.white,
        child: Obx(() {
          return Row(
              children: controller.subHeaderList.map((item) {
            return Expanded(
                child: InkWell(
              onTap: () {
                controller.subHeaderIndex.value = item["id"];
                controller.scrollController.jumpTo(controller.gk2Position);
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  item["title"],
                  style: TextStyle(
                      color: controller.subHeaderIndex.value == item["id"]
                          ? Colors.red
                          : Colors.black),
                ),
              ),
            ));
          }).toList());
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 透明导航
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
          child: const ProductAppBarView(),
        ),
        body: SizedBox(
          height: ScreenAdapter.getScreenHeight(),
          width: ScreenAdapter.getScreenWidth(),
          child: Stack(
            children: [
              ContentView(subHeader),
              const BottomBar(),
              Obx(() => controller.isShowSunHeaders.value
                  ? Positioned(
                      top: ScreenAdapter.getStatusBarHeight() +
                          ScreenAdapter.height(120),
                      left: 0,
                      right: 0,
                      child: subHeader())
                  : const Text(""))
            ],
          ),
        ));
  }
}
