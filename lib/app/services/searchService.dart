import 'package:xmshop/app/services/storage.dart';

class SearchServices {
  /// 保存搜索记录
  static setHistoryData(value) async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      var isHasData = searchListData.any((item) => item == value);
      if (!isHasData) {
        searchListData.add(value);
        await Storage.setData("searchList", searchListData);
      }
    } else {
      List tempList = [];
      tempList.add(value);
      await Storage.setData("searchList", tempList);
    }
  }

  /// 读取历史搜索记录
  static getHistoryData() async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      return searchListData;
    } else {
      return [];
    }
  }

  /// 删除历史搜索记录
  static delHistoryData(key) async {
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      searchListData.remove(key);
      await Storage.setData("searchList", searchListData);
    }
  }

  /// 清空搜索记录
  static delAllHistoryData() async {
    await Storage.clear();
  }
}
