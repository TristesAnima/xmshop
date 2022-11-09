import 'package:get/get.dart';
import 'package:xmshop/app/services/searchService.dart';

class SearchController extends GetxController {
  String keyWords = '';
  RxList history = [].obs;

  getHistoryData() async {
    var templist = await SearchServices.getHistoryData() as List;
    history.value = templist;
    update();
  }

  clearHistoryData() async {
    await SearchServices.delAllHistoryData();
    history.clear();
    update();
  }

  removeItem(String value) async {
    await SearchServices.delHistoryData(value);
  }

  @override
  void onInit() {
    super.onInit();

    getHistoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
