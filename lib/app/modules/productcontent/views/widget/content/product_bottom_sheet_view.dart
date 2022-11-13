import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/modules/productcontent/views/itemNumber/item_number_view.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductBottomSheetView extends GetView<ProductcontentController> {
  final int action;
  const ProductBottomSheetView(this.action, {Key? key}) : super(key: key);

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
            child: Stack(children: [
              ListView(
                children: [
                  ...controller.Pcontent.value.attr!.map((item) {
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
                  Padding(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "数量:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ItemNumberView()
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Get.back();
                    },
                  )),
              Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: action == 1
                      ? Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: ScreenAdapter.height(120),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.width(20)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    255, 165, 0, 0.9)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    onPressed: () {
                                      controller.addCart();
                                    },
                                    child: const Text("加入购物车"),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: ScreenAdapter.height(120),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.width(20)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    235, 1, 0, 0.9)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    onPressed: () {
                                      controller.buy();
                                    },
                                    child: const Text("确定"),
                                  ),
                                ))
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: ScreenAdapter.height(120),
                                  margin: EdgeInsets.only(
                                      right: ScreenAdapter.width(20)),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color.fromRGBO(
                                                    235, 1, 0, 0.9)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                    onPressed: () {
                                      switch (action) {
                                        case 2:
                                          controller.addCart();
                                          break;
                                        case 3:
                                          controller.buy();
                                          break;
                                      }
                                    },
                                    child: const Text("确定"),
                                  ),
                                ))
                          ],
                        ))
            ]),
          );
        }));
  }
}
