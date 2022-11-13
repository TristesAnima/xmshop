import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/widget/bottomBar/bottom_bar_view.dart';
import 'package:xmshop/app/modules/cart/views/widget/content/cart_content_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView {
  CartView({Key? key}) : super(key: key);

  @override
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('购物车'),
          centerTitle: true,
          actions: [TextButton(onPressed: () {}, child: const Text("编辑"))],
        ),
        body: Stack(
          children: const [CartContentView(), BottomBarView()],
        ));
  }
}
