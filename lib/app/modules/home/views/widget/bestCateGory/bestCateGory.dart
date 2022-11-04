import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 首页分类轮播图
class CateGorySwiper extends GetView<HomeController> {
  const CateGorySwiper({Key? key}) : super(key: key);

  final String baseUrl = 'https://xiaomi.itying.com/';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(470),
        child: Obx(
          () => Swiper(
            // 取整
            itemCount: controller.bestCateList.length ~/ 10,
            pagination: SwiperPagination(
                margin: const EdgeInsets.all(0.0),
                builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints.expand(height: ScreenAdapter.height(50)),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: const RectSwiperPaginationBuilder(
                              color: Colors.black12,
                              activeColor: Colors.black54,
                            ).build(context, config),
                          ),
                        )
                      ],
                    ),
                  );
                })),
            itemBuilder: (context, index) {
              return GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: ScreenAdapter.width(20),
                      mainAxisSpacing: ScreenAdapter.width(20)),
                  itemBuilder: (BuildContext context, int i) {
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: ScreenAdapter.width(140),
                          height: ScreenAdapter.height(140),
                          child: Image.network(
                            '$baseUrl${controller.bestCateList[index * 10 + i].pic}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text(
                            controller.bestCateList[index * 10 + i].title,
                            style: TextStyle(fontSize: ScreenAdapter.fs(34)),
                          ),
                        )
                      ],
                    );
                  });
            },
          ),
        ));
  }
}
