import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductBottomSheetView extends GetView<ProductcontentController> {
  const ProductBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bottomsheet更新流数据 需要用 GetBuilder<ProductcontentController>()
    return GetBuilder<ProductcontentController>(
        init: controller,
        builder: ((controller) {
          return Container(
              padding: EdgeInsets.all(ScreenAdapter.height(20)),
              width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.height(1200),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(ScreenAdapter.width(50)),
                      topRight: Radius.circular(ScreenAdapter.width(50)))),
              child: ListView(
                children: controller.Pcontent.value.attr!.map((item) {
                  var v = item.attrList;
                  return Wrap(
                    children: [
                      // 版本
                      Container(
                        padding: EdgeInsets.only(
                            top: ScreenAdapter.height(20),
                            left: ScreenAdapter.height(20),
                            right: ScreenAdapter.height(20)),
                        width: ScreenAdapter.width(1040),
                        child: Text(
                          "${item.cate}:",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                          child: Wrap(
                              spacing: ScreenAdapter.width(20),
                              children: v.map((record) {
                                return InkWell(
                                  onTap: () {
                                    controller.chnageAttr(
                                        item.cate, record["title"]);
                                  },
                                  child: Chip(
                                    backgroundColor: record["checked"]
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            31, 223, 213, 213),
                                    label: Text(record["title"]),
                                  ),
                                );
                              }).toList())),
                    ],
                  );
                }).toList(),
              ));
        }));
  }
}
