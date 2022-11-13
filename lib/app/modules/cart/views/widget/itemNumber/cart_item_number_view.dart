import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class CartItemNumberView extends GetView<CartController> {
  final Map item;
  const CartItemNumberView(this.item, {Key? key}) : super(key: key);

  Widget _left() {
    return InkWell(
      onTap: () {
        controller.desc(item);
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(60),
        child: const Text('-'),
      ),
    );
  }

  Widget _center() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: ScreenAdapter.width(2), color: Colors.black12),
              right: BorderSide(
                  width: ScreenAdapter.width(2), color: Colors.black12))),
      child: Text('${item["count"]}'),
    );
  }

  Widget _right() {
    return InkWell(
      onTap: () {
        controller.add(item);
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(60),
        child: const Text('+'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
          border:
              Border.all(width: ScreenAdapter.width(2), color: Colors.black12)),
      child: Row(
        children: [_left(), _center(), _right()],
      ),
    );
  }
}
