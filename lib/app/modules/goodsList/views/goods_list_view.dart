import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/appBar.dart';
import 'package:xmshop/app/modules/goodsList/views/widget/filterSelection/filter.dart';
import 'package:xmshop/app/modules/goodsList/views/widget/goodsListContent/goodList.dart';

import '../controllers/goods_list_controller.dart';

class GoodsListView extends GetView<GoodsListController> {
  const GoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar: CommonAppBar(hideMsg: true),
        body: Stack(
          children: const [GoodsListContent(), FilterSelection()],
        ));
  }
}
