import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/detail/detail_view.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/goods/goods_view.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/recommand/recommand_view.dart';

class ContentView extends GetView<ProductcontentController> {
  final Function subHeader;
  const ContentView(this.subHeader, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          const ProductGoodsView(),
          ProductDetailView(subHeader),
          const ProductRecommandView()
        ],
      ),
    );
  }
}
