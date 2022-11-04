import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/modules/home/views/widget/banner/banner.dart';
import 'package:xmshop/app/modules/home/views/widget/bannerBottom/bannerBottom.dart';
import 'package:xmshop/app/modules/home/views/widget/bestCateGory/bestCateGory.dart';
import 'package:xmshop/app/modules/home/views/widget/bestSelling/bestSelling.dart';
import 'package:xmshop/app/modules/home/views/widget/goodList/goodList.dart';
import 'package:xmshop/app/modules/home/views/widget/poster/poster.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: -40,
            right: 0,
            bottom: 0,
            left: 0,
            child: ListView(
              controller: controller.scrollController,
              children: const [
                BannerList(),
                BannerBottom(),
                CateGorySwiper(),
                Poster(),
                BestSelling(),
                GoodList(),
              ],
            )),
      ],
    );
  }
}
