import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductRecommandView extends GetView<ProductcontentController> {
  const ProductRecommandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(3600),
      color: Colors.red,
      child: const Text("推荐", style: TextStyle(fontSize: 100)),
    );
  }
}
