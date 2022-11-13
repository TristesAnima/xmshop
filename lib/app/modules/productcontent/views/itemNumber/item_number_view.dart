import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ItemNumberView extends GetView<ProductcontentController> {
  const ItemNumberView({Key? key}) : super(key: key);

  Widget _left() {
    return InkWell(
      onTap: () => controller.desc(),
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(80),
        child: const Text('-'),
      ),
    );
  }

  Widget _center() {
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(80),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: ScreenAdapter.width(2), color: Colors.black12),
              right: BorderSide(
                  width: ScreenAdapter.width(2), color: Colors.black12))),
      child: Obx(() => Text('${controller.buyNum.value}')),
    );
  }

  Widget _right() {
    return InkWell(
      onTap: () => controller.add(),
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(80),
        child: const Text('+'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(80),
      decoration: BoxDecoration(
          border:
              Border.all(width: ScreenAdapter.width(2), color: Colors.black12)),
      child: Row(
        children: [_left(), _center(), _right()],
      ),
    );
  }
}
