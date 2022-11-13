import 'package:xmshop/app/modules/productcontent/models/product_content.dart';
import 'package:xmshop/app/services/storage.dart';

class CartServices {
  static addCart(
      ProductContentResult pcontent, String selectedAttr, int buyNum) async {
    List? cartListData = await Storage.getData('cartList');
    if (cartListData != null) {
      var isHasData = cartListData.any((item) =>
          item["id"] == pcontent.id && item["selectedAttr"] == selectedAttr);
      if (isHasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]["id"] == pcontent.id &&
              cartListData[i]["selectedAttr"] == selectedAttr) {
            cartListData[i]["count"] += buyNum;
          }
        }
        await Storage.setData("cartList", cartListData);
      } else {
        cartListData.add({
          "id": pcontent.id,
          "title": pcontent.title,
          "price": pcontent.price,
          "selectedAttr": selectedAttr,
          "count": buyNum,
          "pic": pcontent.pic,
          "checked": true,
        });
        await Storage.setData("cartList", cartListData);
      }
    } else {
      List tempList = [];
      tempList.add({
        "id": pcontent.id,
        "title": pcontent.title,
        "price": pcontent.price,
        "selectedAttr": selectedAttr,
        "count": buyNum,
        "pic": pcontent.pic,
        "checked": true,
      });
      await Storage.setData("cartList", tempList);
    }
  }

  // 保存数据
  static setCartList(cartListData) async {
    await Storage.setData("cartList", cartListData);
  }

  /// 读取历史搜索记录
  static getCartData() async {
    List? cartListData = await Storage.getData('cartList');
    if (cartListData != null) {
      return cartListData;
    } else {
      return [];
    }
  }

  /// 清空
  static clearCartData() async {
    await Storage.clear();
  }

  // 获取选中的cartList数据
  static getCheckedCartData() async {
    List templist = [];
    List? cartListData = await Storage.getData('cartList');
    if (cartListData != null) {
      for (var i = 0; i < cartListData.length; i++) {
        if (cartListData[i]["checked"]) {
          templist.add(cartListData[i]);
        }
      }
      return cartListData;
    } else {
      return [];
    }
  }
}
