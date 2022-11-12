import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/models/banner.dart';
import 'package:xmshop/app/modules/home/models/bestcate.dart';
import 'package:xmshop/app/modules/home/models/hotSellingGoods.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class HomeController extends GetxController {
  HttpsClient httpsClient = HttpsClient();
  // 浮动导航开关
  RxBool flag = false.obs;
  // 滑动监听
  final ScrollController scrollController = ScrollController();
  // 轮播图
  RxList<BannerResult> swiperList = <BannerResult>[].obs;
  RxList<BestCateResult> bestCateList = <BestCateResult>[].obs;
  RxList<BannerResult> bestSellingSwiperList = <BannerResult>[].obs;
  RxList<HotSellingGoodsResult> hotSellingGoods = <HotSellingGoodsResult>[].obs;
  RxList<HotSellingGoodsResult> goodList = <HotSellingGoodsResult>[].obs;

  void addScrollEvenLister() {
    // 滑动事件监听 实现TabBar
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10) {
        if (flag.value == false) {
          flag.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flag.value == true) {
          flag.value = false;
          update();
        }
      }
    });
  }

  void getBanner() async {
    var response = await httpsClient.get('/api/focus');
    if (response != null) {
      var banners = BannersModel.fromJson(response.data);
      swiperList.value = banners.result;
      update();
    }
  }

  void getBestCate() async {
    var response = await httpsClient.get('/api/bestCate');
    if (response != null) {
      var bestCate = BestCateModel.fromJson(response.data);
      bestCateList.value = bestCate.result;
      update();
    }
  }

  void getBestSellingSwiperList() async {
    var response =
        await httpsClient.get('/api/focus', params: {"position": "2"});
    if (response != null) {
      var swiperList = BannersModel.fromJson(response.data);
      bestSellingSwiperList.value = swiperList.result;
      update();
    }
  }

  void getHotSellingGoods() async {
    var response = await httpsClient.get('/api/plist', params: {"is_hot": "1"});
    if (response != null) {
      var goodsList = HotSellingGoodsModel.fromJson(response.data);
      hotSellingGoods.value = goodsList.result;
      update();
    }
  }

  void getGoodsList() async {
    var response = await httpsClient.get('/api/plist?is_best=1&pageSize=50');
    if (response != null) {
      var goodsList = HotSellingGoodsModel.fromJson(response.data);
      goodList.value = goodsList.result;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();

    addScrollEvenLister();

    getBanner();
    getBestCate();
    getBestSellingSwiperList();
    getHotSellingGoods();
    getGoodsList();
  }
}
