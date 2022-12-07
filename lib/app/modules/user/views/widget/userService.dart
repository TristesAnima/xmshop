import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/iconfont.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class UserService extends GetView {
  const UserService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(ScreenAdapter.height(28)),
                child: Text("服务",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenAdapter.fs(44),
                        fontWeight: FontWeight.bold)),
              ),
              const Text(
                "更多 > ",
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          GridView.count(
            shrinkWrap: true, //收缩
            physics: const NeverScrollableScrollPhysics(), //禁止滑动
            crossAxisCount: 4,
            childAspectRatio: 1.253,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    IconFont.service,
                    color: Colors.blue,
                  ),
                  Text("一键安装")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(IconFont.service, color: Colors.orange),
                  Text("一键退换")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(IconFont.service, color: Colors.purple),
                  Text("一键维修")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(IconFont.service, color: Colors.orange),
                  Text("服务进度")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    IconFont.service,
                    color: Colors.orange,
                  ),
                  Text("小米之家")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    IconFont.service,
                    color: Colors.orange,
                  ),
                  Text("客服中心")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(IconFont.service, color: Colors.green),
                  Text("以旧换新")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(IconFont.service, color: Colors.green),
                  Text("手机电池")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
