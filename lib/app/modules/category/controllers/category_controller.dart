import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/models/tabItems.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class CategoryController extends GetxController {
  HttpsClient httpsClient = HttpsClient();

  RxInt selectIndex = 0.obs;
  RxList<TabItemsResult> sideBarItems = <TabItemsResult>[].obs;
  RxList<TabItemsResult> sideBarItemsData = <TabItemsResult>[].obs;

  void getTabItems() async {
    var response = await httpsClient.get('/api/pcate');
    if (response != null) {
      var tabItems = TabItemsModel.fromJson(response.data);
      sideBarItems.value = tabItems.result;
      getTabItemsData(sideBarItems[0].id);
      update();
    }
  }

  void getTabItemsData(String id) async {
    var response = await httpsClient.get('/api/pcate', params: {"pid": id});
    if (response != null) {
      var tabItemsData = TabItemsModel.fromJson(response.data);
      sideBarItemsData.value = tabItemsData.result;
      update();
    }
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
