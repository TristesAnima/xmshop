import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class TabContent extends GetView<CategoryController> {
  const TabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(50)),
            height: double.infinity,
            child: Obx((() => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: ScreenAdapter.width(40),
                    mainAxisSpacing: ScreenAdapter.height(20),
                    childAspectRatio: 240 / 340,
                  ),
                  itemCount: controller.sideBarItemsData.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/goods-list', arguments: {
                          "cid": controller.sideBarItemsData[index].id
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Image.network(HttpsClient.getAllUri(
                                controller.sideBarItemsData[index].pic)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: ScreenAdapter.height(15)),
                            child: Text(
                              controller.sideBarItemsData[index].title,
                              style: TextStyle(fontSize: ScreenAdapter.fs(32)),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )))));
  }
}
