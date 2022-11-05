import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/goodsList/controllers/goods_list_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class FilterSelection extends GetView<GoodsListController> {
  const FilterSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(120),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: ScreenAdapter.height(2),
                      color: const Color.fromRGBO(233, 233, 233, 0.9)))),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                        ScreenAdapter.height(16)),
                    child: Text(
                      "综合",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red, fontSize: ScreenAdapter.fs(32)),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                        ScreenAdapter.height(16)),
                    child: Text("销量",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ScreenAdapter.fs(32))),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                        ScreenAdapter.height(16)),
                    child: Text("价格",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ScreenAdapter.fs(32))),
                  ),
                  onTap: () {},
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                        ScreenAdapter.height(16)),
                    child: Text("筛选",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: ScreenAdapter.fs(32))),
                  ),
                  onTap: () {
                    //注意：新版本中ScaffoldState? 为可空类型 注意判断
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
