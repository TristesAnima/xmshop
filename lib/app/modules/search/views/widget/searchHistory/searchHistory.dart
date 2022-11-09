import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/controllers/search_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class SearchHistory extends GetView<SearchController> {
  const SearchHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "搜索历史",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fs(42)),
            ),
            IconButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    color: Colors.white,
                    width: ScreenAdapter.getScreenWidth(),
                    height: ScreenAdapter.height(360),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "您确定清空吗",
                              style: TextStyle(fontSize: ScreenAdapter.fs(48)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenAdapter.height(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: const Text("取消")),
                            ElevatedButton(
                              onPressed: () {
                                controller.clearHistoryData();
                                Get.back();
                              },
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                              child: const Text("确定"),
                            )
                          ],
                        )
                      ],
                    ),
                  ));
                },
                icon: const Icon(Icons.delete_outline))
          ],
        ),
        Obx(() => Wrap(
            children: controller.history
                .map((item) => GestureDetector(
                      onLongPress: () {
                        Get.defaultDialog(
                            title: "提示",
                            middleText: "您确定删除吗",
                            confirm: ElevatedButton(
                                onPressed: () async {
                                  await controller.removeItem(item);
                                  await controller.getHistoryData();
                                  Get.back();
                                },
                                child: const Text('确定')),
                            cancel: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('取消')));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: ScreenAdapter.height(32),
                            right: ScreenAdapter.height(32)),
                        padding: EdgeInsets.fromLTRB(
                            ScreenAdapter.height(32),
                            ScreenAdapter.height(16),
                            ScreenAdapter.height(32),
                            ScreenAdapter.height(16)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(ScreenAdapter.width(10))),
                        child: Text(item),
                      ),
                    ))
                .toList()))
      ],
    );
  }
}
