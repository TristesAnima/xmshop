import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 热销甄选
class BestSelling extends GetView<HomeController> {
  const BestSelling({Key? key}) : super(key: key);

  final String baseUrl = 'https://xiaomi.itying.com/';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.width(20),
              ScreenAdapter.width(30),
              ScreenAdapter.width(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '热销臻选',
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(46),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '更多手机推荐 >',
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(38), color: Colors.black54),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30), 0, ScreenAdapter.width(30), 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                      height: ScreenAdapter.width(738),
                      child: Obx(() => Swiper(
                            itemCount: controller.bestSellingSwiperList.length,
                            pagination: const SwiperPagination(
                                builder: SwiperPagination.rect),
                            autoplay: true,
                            loop: true,
                            itemBuilder: (context, index) {
                              return Image.network(
                                '$baseUrl${controller.bestSellingSwiperList[index].pic}',
                                fit: BoxFit.cover,
                              );
                            },
                          )))),
              SizedBox(
                width: ScreenAdapter.width(20),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: ScreenAdapter.width(738),
                      child: Obx(
                        () => Column(
                          children: controller.hotSellingGoods
                              .asMap()
                              .entries
                              .map((entries) {
                            var item = entries.value;
                            var key = entries.key;
                            return Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0,
                                      key == 2 ? 0 : ScreenAdapter.height(10)),
                                  color: const Color.fromRGBO(246, 246, 246, 1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height:
                                                    ScreenAdapter.height(10),
                                              ),
                                              Text(
                                                item.title,
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fs(38),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenAdapter.height(20),
                                              ),
                                              Text(
                                                item.subTitle,
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fs(28),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenAdapter.height(20),
                                              ),
                                              Text(
                                                "￥ ${item.price} 元",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenAdapter.fs(34),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height:
                                                    ScreenAdapter.height(20),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                ScreenAdapter.height(8)),
                                            child: Image.network(
                                              '$baseUrl${item.pic}',
                                              fit: BoxFit.cover,
                                            ),
                                          ))
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                      ))),
            ],
          ),
        ),
      ],
    );
  }
}
