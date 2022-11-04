import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 商品列表
class GoodList extends GetView<HomeController> {
  const GoodList({Key? key}) : super(key: key);

  final String baseUrl = 'https://xiaomi.itying.com/';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.width(50),
              ScreenAdapter.width(30),
              ScreenAdapter.width(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '省心优惠',
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(46),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '全部优惠 >',
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(38), color: Colors.black54),
              ),
            ],
          ),
        ),
        // 瀑布流布局
        Container(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          color: const Color.fromRGBO(246, 246, 246, 1),
          child: Obx(() => MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: ScreenAdapter.width(26),
                crossAxisSpacing: ScreenAdapter.height(26),
                itemCount: controller.goodList.length,
                // 收缩 让元素自适应
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = controller.goodList[index];
                  return Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(5)),
                          child: Image.network(
                            '$baseUrl${item.pic}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(10),
                              ScreenAdapter.width(20),
                              ScreenAdapter.width(10),
                              ScreenAdapter.width(10)),
                          child: Text(
                            item.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: ScreenAdapter.fs(36)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(ScreenAdapter.width(5)),
                          child: Text(
                            item.subTitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenAdapter.fs(32),
                                color: Colors.black54),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(ScreenAdapter.width(5)),
                          child: Text(
                            "￥ ${item.price} 元",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: ScreenAdapter.fs(32)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
