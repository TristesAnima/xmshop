import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/goodsList/controllers/goods_list_controller.dart';

class FilterDrawer extends GetView<GoodsListController> {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        child: Text('12'),
      ),
    );
  }
}
