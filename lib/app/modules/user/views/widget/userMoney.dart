import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

/// 用户资金信息
class UserMoney extends GetView {
  const UserMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(160),
      margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "-",
                    style: TextStyle(
                      fontSize: ScreenAdapter.fs(80),
                    ),
                  ),
                  Text("米金",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fs(34),
                          color: Colors.black45)),
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "-",
                    style: TextStyle(fontSize: ScreenAdapter.fs(80)),
                  ),
                  Text("优惠券",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fs(34),
                          color: Colors.black45))
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("-", style: TextStyle(fontSize: ScreenAdapter.fs(80))),
                  Text("红包",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fs(34),
                          color: Colors.black45))
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("-", style: TextStyle(fontSize: ScreenAdapter.fs(80))),
                  Text("最高额度",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fs(34),
                          color: Colors.black45))
                ],
              )),
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.bookmarks_outlined),
                  Text("钱包",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fs(34),
                          color: Colors.black45))
                ],
              ))
        ],
      ),
    );
  }
}
