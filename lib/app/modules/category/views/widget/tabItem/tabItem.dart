import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class TabItems extends GetView<CategoryController> {
  const TabItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenAdapter.width(280),
        height: double.infinity,
        child: Obx(
          () => ListView.builder(
            itemCount: controller.sideBarItems.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  width: double.infinity,
                  height: ScreenAdapter.height(180),
                  child: InkWell(
                      onTap: () {
                        controller.changeIndex(
                            index, controller.sideBarItems[index].id);
                      },
                      child: Obx(
                        () => Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: ScreenAdapter.width(10),
                                height: ScreenAdapter.height(46),
                                margin: EdgeInsets.only(
                                    left: ScreenAdapter.width(15)),
                                color: controller.selectIndex.value == index
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                controller.sideBarItems[index].title,
                                style: TextStyle(
                                    fontSize:
                                        controller.selectIndex.value == index
                                            ? ScreenAdapter.fs(38)
                                            : ScreenAdapter.fs(36),
                                    fontWeight:
                                        controller.selectIndex.value == index
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      )));
            },
          ),
        ));
  }
}
