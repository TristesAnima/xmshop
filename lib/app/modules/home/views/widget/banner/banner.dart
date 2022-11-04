import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 轮播图
class BannerList extends GetView<HomeController> {
  const BannerList({Key? key}) : super(key: key);

  final String baseUrl = 'https://xiaomi.itying.com/';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.width(682),
        child: Obx(
          () => Swiper(
            itemBuilder: (context, index) {
              return Image.network(
                '$baseUrl${controller.swiperList[index].pic}',
                fit: BoxFit.cover,
              );
            },
            itemCount: controller.swiperList.length,
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            autoplay: true,
            loop: true,
          ),
        ));
  }
}
