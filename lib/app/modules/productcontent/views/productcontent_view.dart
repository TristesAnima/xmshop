import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/appBar/appBar.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/bottomBar/bottomBar.dart';
import 'package:xmshop/app/modules/productcontent/views/widget/content/content.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/productcontent_controller.dart';

class ProductcontentView extends GetView<ProductcontentController> {
  const ProductcontentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 透明导航
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
          child: ProductAppBarView(),
        ),
        body: SizedBox(
          height: ScreenAdapter.getScreenHeight(),
          width: ScreenAdapter.getScreenWidth(),
          child: Stack(
            children: const [ContentView(), BottomBar()],
          ),
        ));
  }
}
