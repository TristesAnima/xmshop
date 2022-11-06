import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/controllers/search_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class HotGoods extends GetView<SearchController> {
  const HotGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenAdapter.height(138),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hot_search.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
              padding: EdgeInsets.all(ScreenAdapter.width(10)),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // 收缩
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenAdapter.width(40),
                  mainAxisSpacing: ScreenAdapter.height(20),
                  childAspectRatio: 3 / 1,
                ),
                itemCount: 30,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: ScreenAdapter.width(120),
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Image.network(
                          'https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1666797996.71261567.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: const Text("小米净化器 热水器"),
                          ))
                    ],
                  );
                }),
              ))
        ],
      ),
    );
  }
}
