import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class BottomBarView extends GetView<CartController> {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      initState: (state) => controller.getCartListData(),
      init: controller,
      builder: (controller) {
        return controller.cartList.isNotEmpty
            ? Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: ScreenAdapter.getScreenWidth(),
                  height: ScreenAdapter.height(190),
                  padding: EdgeInsets.only(
                      left: ScreenAdapter.width(20),
                      right: ScreenAdapter.width(30)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(
                              color: Colors.black12,
                              width: ScreenAdapter.height(2)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.red,
                              value: controller.checkedAllBox.value,
                              onChanged: (value) {
                                controller.checkedAllFn(value);
                              }),
                          const Text('全选')
                        ],
                      ),
                      Row(
                        children: [
                          const Text("合计"),
                          Text(
                            "￥ 218",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fs(58),
                                color: Colors.red),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(20),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(255, 165, 0, 0.9)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              onPressed: () {},
                              child: const Text("结算"))
                        ],
                      )
                    ],
                  ),
                ))
            : const Text('');
      },
    );
  }
}
