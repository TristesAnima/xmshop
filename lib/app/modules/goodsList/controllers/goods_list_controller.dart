import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/models/hotSellingGoods.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class GoodsListController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  ScrollController scrollController = ScrollController();

  RxList<HotSellingGoodsResult> pList = <HotSellingGoodsResult>[].obs;
  int page = 1;
  int pageSize = 10;
  bool flag = true;
  RxBool isHasData = true.obs;

  void onScrollController() {
    scrollController.addListener(() {
      // scrollController.position.pixels 滚动条下拉高度
      // scrollController.position.maxScrollExtent 页面高度
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        getPListData();
      }
    });
  }

  void getPListData() async {
    if (flag && isHasData.value) {
      flag = false;
      var response = await httpsClient.get('/api/plist', params: {
        "cid": "${Get.arguments["cid"]}",
        'page': "$page",
        'pageSize': '$pageSize'
      });
      if (response != null) {
        var items = HotSellingGoodsModel.fromJson(response.data);
        // 数据拼接
        pList.value = [...pList, ...items.result];
        page++;
        update();
        flag = true;
        if (items.result.length < pageSize) {
          isHasData.value = false;
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    onScrollController();

    getPListData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
