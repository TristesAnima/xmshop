import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/models/product_content.dart';
import 'package:xmshop/app/services/cartService.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductcontentController extends GetxController {
  final ScrollController scrollController = ScrollController();
  HttpsClient httpsClient = HttpsClient();

  RxDouble opacity = 0.0.obs;
  // 是否显示TAbs
  RxBool isShowTabs = false.obs;
  List tabsList = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  RxInt selectTabsIndex = 1.obs;
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  var Pcontent = ProductContentResult().obs;
  //attr
  RxList<Attr> pcontentAttr = <Attr>[].obs;
  double gk1Position = 0;
  double gk2Position = 0;
  double gk3Position = 0;
  RxBool isShowSunHeaders = false.obs;

  List subHeaderList = [
    {"id": 1, "title": "商品介绍"},
    {"id": 2, "title": "规格参数"},
  ];
  RxInt subHeaderIndex = 1.obs;

  // 保存筛选属性值
  RxString selectedAttr = ''.obs;
  // 购买数量
  RxInt buyNum = 1.obs;

  void addScrollEvenLister() {
    // 滑动事件监听 实现TabBar
    scrollController.addListener(() {
      if (gk2Position == 0 && gk3Position == 0) {
        // 获取渲染后元素的位置
        getContainerPosition(scrollController.position.pixels);
      }
      if (scrollController.position.pixels > gk2Position &&
          scrollController.position.pixels < gk3Position) {
        if (isShowSunHeaders.value == false) {
          isShowSunHeaders.value = true;
          selectTabsIndex.value = 2;
        }
      } else if (scrollController.position.pixels > 0 &&
          scrollController.position.pixels < gk2Position) {
        if (isShowSunHeaders.value == true) {
          isShowSunHeaders.value = false;
          selectTabsIndex.value = 1;
        }
      } else if (scrollController.position.pixels > gk2Position) {
        selectTabsIndex.value = 3;
      }

      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (opacity.value > 0.978) {
          opacity.value = 1;
        }
        if (isShowTabs.value == true) {
          isShowTabs.value = false;
        }
      } else {
        if (isShowTabs.value == false) {
          isShowTabs.value = true;
        }
      }
      update();
    });
  }

  // 获取元素位置
  getContainerPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Position = box2.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Position = box3.localToGlobal(Offset.zero).dy +
        pixels -
        (ScreenAdapter.getStatusBarHeight() + ScreenAdapter.height(120));
  }

  void changeSelectIndex(int index) {
    selectTabsIndex.value = index;
    update();
  }

  void getProductContent() async {
    var response = await httpsClient
        .get('/api/pcontent', params: {"id": Get.arguments["id"]});
    if (response != null) {
      var templateData = ProductContentModel.fromJson(response.data);
      Pcontent.value = templateData.result!;
      pcontentAttr.value = Pcontent.value.attr!;
      initAttr(Pcontent.value.attr!);
      getAttr();
      update();
    }
  }

  //初始化attr
  initAttr(List<Attr> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list.length; j++) {
        attr[i]
            .attrList
            .add({"title": attr[i].list[j], "checked": j == 0 ? true : false});
      }
    }
  }

  void chnageAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList.length; j++) {
          pcontentAttr[i].attrList[j]["checked"] = false;
          if (pcontentAttr[i].attrList[j]["title"] == title) {
            pcontentAttr[i].attrList[j]["checked"] = true;
          }
        }
      }
    }
    update();
  }

  void getAttr() {
    List tempList = [];
    for (var i = 0; i < pcontentAttr.length; i++) {
      for (var j = 0; j < pcontentAttr[i].attrList.length; j++) {
        if (pcontentAttr[i].attrList[j]["checked"]) {
          tempList.add(pcontentAttr[i].attrList[j]["title"]);
        }
      }
    }
    selectedAttr.value = tempList.join(",");
  }

  void add() {
    buyNum.value++;
    update();
  }

  void desc() {
    if (buyNum.value > 1) {
      buyNum.value--;
      update();
    }
  }

// 加入购物车
  void addCart() {
    getAttr();
    CartServices.addCart(Pcontent.value, selectedAttr.value, buyNum.value);
    Get.back();
    Get.snackbar("提示", "添加购物车成功");
  }

// 立即购买
  void buy() {
    getAttr();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();

    addScrollEvenLister();
    getProductContent();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
