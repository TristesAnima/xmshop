import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductDetailView extends GetView<ProductcontentController> {
  final Function subHeader;
  const ProductDetailView(this.subHeader, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      child: Column(
        children: [
          subHeader(),
          Obx(() {
            return Container(
                child: Html(
              data: controller.subHeaderIndex.value == 1
                  ? controller.Pcontent.value.content
                  : controller.Pcontent.value.specs,
            ));
          })
        ],
      ),
    );
  }
}
