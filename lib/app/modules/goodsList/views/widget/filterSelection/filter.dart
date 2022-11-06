import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/goodsList/controllers/goods_list_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class FilterSelection extends GetView<GoodsListController> {
  const FilterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(120),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        width: ScreenAdapter.height(2),
                        color: const Color.fromRGBO(233, 233, 233, 0.9)))),
            child: Obx(() => Row(
                  children: controller.subHeaderList.map(
                    ((item) {
                      return Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0,
                                    ScreenAdapter.height(16),
                                    0,
                                    ScreenAdapter.height(16)),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                    fontSize: ScreenAdapter.fs(32),
                                    color: controller.selectHeaderId.value ==
                                            item['id']
                                        ? Colors.red
                                        : Colors.black54,
                                  )),
                                  onPressed: () {
                                    controller.changeSubSelect(item["id"]);
                                  },
                                  child: Text(item['title']),
                                ),
                              ),
                              item['id'] == 2 ||
                                      item['id'] == 3 ||
                                      controller.subHeaderListSort.value == 1 ||
                                      controller.subHeaderListSort.value == -1
                                  ? controller.subHeaderList[item['id'] - 1]
                                              ['sort'] ==
                                          1
                                      ? const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black54,
                                        )
                                      : const Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.black54,
                                        )
                                  : const Text(""),
                            ],
                          ));
                    }),
                  ).toList(),
                ))));
  }
}
