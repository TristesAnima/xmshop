import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/controllers/productcontent_controller.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/product_bottom_sheet_view.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class ProductGoodsView extends GetView<ProductcontentController> {
  const ProductGoodsView({Key? key}) : super(key: key);

  void showSheet(int action) {
    Get.bottomSheet(ProductBottomSheetView(action));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk1,
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        width: ScreenAdapter.getScreenWidth(),
        child: Obx(() {
          var item = controller.Pcontent.value;
          return item.id != null
              ? Column(
                  children: [
                    // 图片
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Image.network(
                        HttpsClient.getAllUri(item.pic!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // 标题
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: Text(
                        item.title!,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: ScreenAdapter.fs(46)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: Text(
                        item.subTitle!,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: ScreenAdapter.fs(34)),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "价格",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "￥ ${item.price}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: ScreenAdapter.fs(66)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "原价",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "￥ ${item.oldPrice}",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: ScreenAdapter.fs(46),
                                      decoration: TextDecoration.lineThrough),
                                )
                              ],
                            ),
                          ],
                        )),
                    // 已选
                    Container(
                      height: ScreenAdapter.height(140),
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: InkWell(
                        onTap: () {
                          showSheet(1);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "已选",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenAdapter.height(20)),
                                  child: Text(
                                    controller.selectedAttr.value,
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black38,
                              size: ScreenAdapter.fs(46),
                            )
                          ],
                        ),
                      ),
                    ),
                    // 门店
                    Container(
                        height: ScreenAdapter.height(140),
                        padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(Container(
                              padding: EdgeInsets.all(ScreenAdapter.height(20)),
                              width: ScreenAdapter.getScreenWidth(),
                              height: ScreenAdapter.height(1000),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          ScreenAdapter.width(50)),
                                      topRight: Radius.circular(
                                          ScreenAdapter.width(50)))),
                              child: ListView(
                                children: const [
                                  Text(
                                      ''' 采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  
                            采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  
                            采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  ''')
                                ],
                              ),
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "门店",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ScreenAdapter.height(20)),
                                    child: const Text(
                                      "小米之家万达专卖店",
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black38,
                                size: ScreenAdapter.fs(46),
                              )
                            ],
                          ),
                        )),
                    // 服务
                    Container(
                        height: ScreenAdapter.height(140),
                        padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(Container(
                              padding: EdgeInsets.all(ScreenAdapter.height(20)),
                              width: ScreenAdapter.getScreenWidth(),
                              height: ScreenAdapter.height(1000),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          ScreenAdapter.width(50)),
                                      topRight: Radius.circular(
                                          ScreenAdapter.width(50)))),
                              child: ListView(
                                children: const [
                                  Text(
                                      ''' 采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  
                            采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  
                            采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  采用旗舰级ALD镀膜，有效降低眩光及鬼影。超大光圈，自动对焦，拍清你的每一处好看。  ''')
                                ],
                              ),
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "服务 ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset("assets/images/service.png")
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black38,
                                size: ScreenAdapter.fs(46),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              : SizedBox(
                  height: ScreenAdapter.getScreenHeight(),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        }));
  }
}
