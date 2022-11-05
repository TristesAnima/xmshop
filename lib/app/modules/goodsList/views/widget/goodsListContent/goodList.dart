import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/progressLoading.dart';
import 'package:xmshop/app/modules/goodsList/controllers/goods_list_controller.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class GoodsListContent extends GetView<GoodsListController> {
  const GoodsListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.pList.isNotEmpty
        ? ListView.builder(
            controller: controller.scrollController,
            padding: EdgeInsets.fromLTRB(ScreenAdapter.height(26),
                ScreenAdapter.height(140), ScreenAdapter.height(26), 0),
            itemCount: controller.pList.length,
            itemBuilder: (context, index) {
              var item = controller.pList[index];
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.width(20)),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(bottom: ScreenAdapter.height(26)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(60)),
                          width: ScreenAdapter.width(400),
                          height: ScreenAdapter.height(460),
                          child: Image.network(
                            HttpsClient.getAllUri(item.pic),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.width(20)),
                              child: Text(
                                item.title,
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fs(42),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(ScreenAdapter.width(20)),
                              child: Text(
                                item.subTitle,
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fs(30),
                                    color: Colors.black54),
                              ),
                            ),
                            Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(20)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: TextStyle(
                                              fontSize: ScreenAdapter.fs(32),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "8999",
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fs(30),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fs(32),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "899",
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fs(30),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: TextStyle(
                                              fontSize: ScreenAdapter.fs(32),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "99起",
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fs(30),
                                          ),
                                        ),
                                      ],
                                    ))
                                  ],
                                )),
                            Text(
                              "￥ ${item.price} 元",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fs(30),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                  index == controller.pList.length - 1
                      ? Loading(loading: controller.isHasData.value)
                      : const Text(""),
                ],
              );
            })
        : Loading(loading: controller.isHasData.value));
  }
}
