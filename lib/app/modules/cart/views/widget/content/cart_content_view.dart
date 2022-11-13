import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/modules/cart/views/widget/itemNumber/cart_item_number_view.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class CartContentView extends GetView<CartController> {
  const CartContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        initState: (state) {
          controller.getCartListData();
        },
        init: controller,
        builder: (controller) {
          return controller.cartList.isNotEmpty
              ? ListView(
                  padding: EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                  children: controller.cartList.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                                  color:
                                      const Color.fromARGB(178, 240, 236, 236),
                                  width: ScreenAdapter.height(2)))),
                      padding: EdgeInsets.all(ScreenAdapter.width(20)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: ScreenAdapter.width(100),
                            child: Checkbox(
                                activeColor: Colors.red,
                                value: item["checked"],
                                onChanged: (value) {
                                  controller.checkedItem(item);
                                }),
                          ),
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.width(24)),
                            margin:
                                EdgeInsets.only(right: ScreenAdapter.width(24)),
                            width: ScreenAdapter.width(260),
                            child: Image.network(
                              HttpsClient.getAllUri(item["pic"]),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${item["title"]}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fs(36),
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Chip(
                                        backgroundColor: const Color.fromARGB(
                                            255, 231, 233, 235),
                                        label: Text(
                                          "${item["selectedAttr"]}",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: ScreenAdapter.fs(28)),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "￥ ${item["price"]}",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fs(58),
                                          color: Colors.red),
                                    ),
                                    CartItemNumberView(item),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                )
              : const Center(
                  child: Text("购物车空空的......"),
                );
        });
  }
}
