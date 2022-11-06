import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/appBar.dart';
import 'package:xmshop/app/modules/goodsList/views/widget/Drawer/drawer.dart';
import 'package:xmshop/app/modules/goodsList/views/widget/filterSelection/filter.dart';
import 'package:xmshop/app/modules/goodsList/views/widget/goodsListContent/goodList.dart';

import '../controllers/goods_list_controller.dart';

class GoodsListView extends GetView<GoodsListController> {
  const GoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.globalKey,
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar:
            CommonAppBar(hideMsg: true, keyWords: controller.keyWords ?? ''),
        body: Stack(
          children: const [GoodsListContent(), FilterSelection()],
        ),
        endDrawer: const FilterDrawer());
  }
}
