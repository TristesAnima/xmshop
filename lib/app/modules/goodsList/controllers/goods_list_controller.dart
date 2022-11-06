import 'package:flutter/material.dart';
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
  String sort = '';
  /*二级导航数据*/
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];
  //二级导航选中判断
  RxInt selectHeaderId = 1.obs;
  RxInt subHeaderListSort = 0.obs;

// 搜索传值
  String? keyWords = Get.arguments['keyWords'];
  String? cid = Get.arguments['cid'];
  String? apiUri;

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

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

  void changeSubSelect(id) {
    if (id == 4) {
      globalKey.currentState!.openEndDrawer();
      selectHeaderId.value = id;
    } else {
      selectHeaderId.value = id;
      sort =
          "${subHeaderList[id - 1]['fileds']}_${subHeaderList[id - 1]['sort']}";
      subHeaderList[id - 1]['sort'] = subHeaderList[id - 1]['sort'] * -1;
      subHeaderListSort.value = subHeaderList[id - 1]['sort'];
      page = 1;
      pList.value = [];
      isHasData.value = true;
      // 滚动条回到顶部
      scrollController.jumpTo(0);
      getPListData();
      update();
    }
  }

  void getPListData() async {
    if (flag && isHasData.value) {
      flag = false;
      Map params = {};
      if (cid != null) {
        params = {"cid": cid};
      } else {
        params = {"search": keyWords};
      }
      var response = await httpsClient.get('/api/plist', params: {
        ...params,
        'page': "$page",
        'pageSize': '$pageSize',
        "sort": sort
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
