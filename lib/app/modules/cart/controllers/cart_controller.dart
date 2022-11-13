import 'package:get/get.dart';
import 'package:xmshop/app/services/cartService.dart';

class CartController extends GetxController {
  RxList cartList = [].obs;
  RxBool checkedAllBox = false.obs;

  void getCartListData() async {
    var templist = await CartServices.getCartData();
    cartList.value = templist;
    update();
  }

  void add(item) {
    var templist = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["id"] == item["id"] &&
          cartList[i]["selectedAttr"] == item['selectedAttr']) {
        item["count"]++;
      }
      templist.add(cartList[i]);
    }
    cartList.value = templist;
    CartServices.setCartList(templist);
    update();
  }

  void desc(item) {
    var templist = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["id"] == item["id"] &&
          cartList[i]["selectedAttr"] == item['selectedAttr']) {
        if (item["count"] > 1) {
          item["count"]--;
        } else {
          Get.snackbar("提示！", "最后一个不能再少辣");
        }
      }
      templist.add(cartList[i]);
    }
    cartList.value = templist;
    CartServices.setCartList(templist);
    update();
  }

  void checkedItem(item) {
    var templist = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["id"] == item["id"] &&
          cartList[i]["selectedAttr"] == item['selectedAttr']) {
        cartList[i]["checked"] = !cartList[i]["checked"];
      }
      templist.add(cartList[i]);
    }
    cartList.value = templist;
    checkedAllBox.value = isAllCheck();
    CartServices.setCartList(templist);
    update();
  }

  void checkedAllFn(value) {
    checkedAllBox.value = value;
    var templist = [];
    for (var i = 0; i < cartList.length; i++) {
      cartList[i]["checked"] = value;
      templist.add(cartList[i]);
    }
    cartList.value = templist;
    CartServices.setCartList(templist);
    update();
  }

  bool isAllCheck() {
    if (cartList.isNotEmpty) {
      for (var i = 0; i < cartList.length; i++) {
        if (!cartList[i]["checked"]) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
