import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/appBar.dart';
import 'package:xmshop/app/modules/category/views/widget/tabContent/tabContent.dart';
import 'package:xmshop/app/modules/category/views/widget/tabItem/tabItem.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Row(
        children: const [
          TabItems(),
          TabContent(),
        ],
      ),
    );
  }
}
