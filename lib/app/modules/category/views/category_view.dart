import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/views/widget/tabContent/tabContent.dart';
import 'package:xmshop/app/modules/category/views/widget/tabItem/tabItem.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromRGBO(246, 246, 246, 1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, 4, 0),
                child: const Icon(Icons.search),
              ),
              Text(
                "手机",
                style: TextStyle(
                    fontSize: ScreenAdapter.fs(32), color: Colors.black45),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message_outlined,
                color: Colors.black87,
              )),
        ],
      ),
      body: Row(
        children: const [
          TabItems(),
          TabContent(),
        ],
      ),
    );
  }
}
