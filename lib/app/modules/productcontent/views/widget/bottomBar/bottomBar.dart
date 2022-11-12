import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/product_bottom_sheet_view.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class BottomBar extends GetView<ProductcontentController> {
  const BottomBar({Key? key}) : super(key: key);

  void showSheet() {
    Get.bottomSheet(const ProductBottomSheetView());
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: ScreenAdapter.height(160),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenAdapter.width(1),
                      color: const Color.fromARGB(255, 187, 184, 184)))),
          child: Row(
            children: [
              SizedBox(
                  width: ScreenAdapter.width(200),
                  height: ScreenAdapter.height(160),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart),
                      Text(
                        "购物车",
                        style: TextStyle(fontSize: ScreenAdapter.fs(30)),
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenAdapter.height(120),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(255, 165, 0, 0.9)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        showSheet();
                      },
                      child: const Text("加入购物车"),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenAdapter.height(120),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(20)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(235, 1, 0, 0.9)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () {
                        showSheet();
                      },
                      child: const Text("立即购买"),
                    ),
                  ))
            ],
          ),
        ));
  }
}
