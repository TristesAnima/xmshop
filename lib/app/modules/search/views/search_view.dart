import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/views/widget/guessYouSearch/guessYouSearch.dart';
import 'package:xmshop/app/modules/search/views/widget/hotGoods/hotGoods.dart';
import 'package:xmshop/app/modules/search/views/widget/searchHistory/searchHistory.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/services/searchService.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Container(
              width: ScreenAdapter.width(900),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(246, 246, 246, 1)),
              child: TextField(
                // 修改搜索框字体
                style: TextStyle(fontSize: ScreenAdapter.fs(36)),
                autofocus: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        // 无边框
                        borderSide: BorderSide.none)),
                onChanged: (value) {
                  controller.keyWords = value;
                },
                // 键盘回车事件
                onSubmitted: (value) async {
                  // 替换路由
                  if (value != "") {
                    await SearchServices.setHistoryData(value);
                    await controller.getHistoryData();
                    Get.toNamed('/goods-list', arguments: {"keyWords": value});
                  }
                },
              )),
          actions: [
            TextButton(
              child: Text(
                "搜索",
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(36), color: Colors.black54),
              ),
              onPressed: () async {
                if (controller.keyWords != "") {
                  await SearchServices.setHistoryData(controller.keyWords);
                  await controller.getHistoryData();
                  Get.toNamed('/goods-list',
                      arguments: {"keyWords": controller.keyWords});
                }
              },
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(30)),
          children: [
            Obx(() => controller.history.isNotEmpty
                ? const SearchHistory()
                : const Text("")),
            Obx(
              () => SizedBox(
                height: controller.history.isNotEmpty ? 20 : 0,
              ),
            ),
            const GuessYouSearch(),
            const SizedBox(
              height: 20,
            ),
            const HotGoods(),
          ],
        ));
  }
}
