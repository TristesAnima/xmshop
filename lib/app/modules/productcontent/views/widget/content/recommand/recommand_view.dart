import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';

class ProductRecommandView extends GetView<ProductcontentController> {
  const ProductRecommandView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      height: 300,
      child: Text("page3"),
    );
  }
}
