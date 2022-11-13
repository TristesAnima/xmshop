import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductAppBarView extends GetView<ProductcontentController> {
  const ProductAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppBar(
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          elevation: 0,
          title: SizedBox(
            width: ScreenAdapter.width(400),
            height: ScreenAdapter.height(96),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: controller.isShowTabs.value
                  ? controller.tabsList.map((item) {
                      return InkWell(
                        onTap: () {
                          controller.changeSelectIndex(item["id"]);
                          // 跳转到对应容器
                          switch (item["id"]) {
                            case 1:
                              Scrollable.ensureVisible(
                                  controller.gk1.currentContext as BuildContext,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.ease);
                              break;
                            case 2:
                              Scrollable.ensureVisible(
                                  controller.gk2.currentContext as BuildContext,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.ease);
                              Timer.periodic(const Duration(milliseconds: 151),
                                  (timer) {
                                controller.scrollController.jumpTo(controller
                                        .scrollController.position.pixels -
                                    ScreenAdapter.height(120));
                                timer.cancel();
                              });
                              break;
                            case 3:
                              Scrollable.ensureVisible(
                                  controller.gk3.currentContext as BuildContext,
                                  duration: const Duration(milliseconds: 150),
                                  curve: Curves.ease);
                              Timer.periodic(const Duration(milliseconds: 151),
                                  (timer) {
                                controller.scrollController.jumpTo(controller
                                        .scrollController.position.pixels -
                                    ScreenAdapter.height(120));
                                timer.cancel();
                              });
                              break;
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item["title"],
                              style: TextStyle(fontSize: ScreenAdapter.fs(36)),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: ScreenAdapter.height(10)),
                                width: ScreenAdapter.width(100),
                                height: ScreenAdapter.height(4),
                                color: item["id"] ==
                                        controller.selectTabsIndex.value
                                    ? Colors.red
                                    : Colors.black12)
                          ],
                        ),
                      );
                    }).toList()
                  : [],
            ),
          ),
          leading: Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: ScreenAdapter.width(88),
                height: ScreenAdapter.height(88),
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(0)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(const CircleBorder())),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    )),
              )),
          actions: [
            Container(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.height(88),
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  child: const Icon(
                    Icons.file_upload_outlined,
                  )),
            ),
            Container(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.height(88),
              margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
              child: ElevatedButton(
                  onPressed: () {
                    showMenu(
                        color: Colors.black87.withOpacity(0.7),
                        context: context,
                        position: RelativeRect.fromLTRB(
                            ScreenAdapter.getScreenWidth(),
                            ScreenAdapter.height(220),
                            ScreenAdapter.width(20),
                            ScreenAdapter.width(0)),
                        items: [
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              Text(
                                "首页",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              Text(
                                "消息",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Text(
                                "收藏",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ))
                        ]);
                  },
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(0)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(const CircleBorder())),
                  child: const Icon(
                    Icons.more_horiz_rounded,
                  )),
            ),
          ],
        ));
  }
}
