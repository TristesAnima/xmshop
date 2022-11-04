import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/models/tabItems.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  RxList<TabItemsResult> sideBarItems = <TabItemsResult>[].obs;
  RxList<TabItemsResult> sideBarItemsData = <TabItemsResult>[].obs;

  void getTabItems() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/pcate');
    var tabItems = TabItemsModel.fromJson(response.data);
    sideBarItems.value = tabItems.result;
    getTabItemsData(sideBarItems[0].id);
    update();
  }

  void getTabItemsData(String id) async {
    var response = await Dio().get('https://xiaomi.itying.com/api/pcate',
        queryParameters: {"pid": id});
    var tabItemsData = TabItemsModel.fromJson(response.data);
    sideBarItemsData.value = tabItemsData.result;
    update();
  }

  void changeIndex(index, id) {
    selectIndex.value = index;
    getTabItemsData(id);
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getTabItems();
  }
}
