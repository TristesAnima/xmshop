import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class UserBook extends GetView {
  const UserBook({super.key});

  @override
  Widget build(BuildContext context) {
    return //订单
        Container(
      margin: EdgeInsets.only(
        top: ScreenAdapter.height(50),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
      child: Column(
        children: [
          Container(
            height: ScreenAdapter.height(100),
            margin: EdgeInsets.only(
                top: ScreenAdapter.height(20),
                bottom: ScreenAdapter.height(20)),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "收藏",
                        style: TextStyle(color: Colors.black54),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                            width: ScreenAdapter.width(2),
                            color: Colors.black12),
                        right: BorderSide(
                            width: ScreenAdapter.width(2),
                            color: Colors.black12),
                      )),
                      child: const Text("足迹",
                          style: TextStyle(color: Colors.black54)),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text("关注",
                          style: TextStyle(color: Colors.black54)),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(20), right: ScreenAdapter.width(20)),
            child: Divider(
              height: ScreenAdapter.height(2),
              color: Colors.black12,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(40),
                bottom: ScreenAdapter.height(40)),
            height: ScreenAdapter.height(240),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.bookmarks_outlined, color: Colors.black87),
                        Text("待付款", style: TextStyle(color: Colors.black87))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.car_crash, color: Colors.black87),
                        Text("待收货", style: TextStyle(color: Colors.black87))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.question_answer_outlined,
                          color: Colors.black87,
                        ),
                        Text("待评价", style: TextStyle(color: Colors.black87))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.design_services_outlined,
                            color: Colors.black87),
                        Text("退换/售后", style: TextStyle(color: Colors.black87))
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.copy_all_rounded, color: Colors.black87),
                        Text("全部订单", style: TextStyle(color: Colors.black87))
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
