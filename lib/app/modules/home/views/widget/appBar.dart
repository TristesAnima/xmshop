import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/services/iconfont.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class HomeAppBar extends GetView<HomeController> {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Obx(
          () => AppBar(
            centerTitle: true,
            backgroundColor:
                controller.flag.value ? Colors.white : Colors.transparent,
            elevation: 0,
            leadingWidth: controller.flag.value ? 10 : ScreenAdapter.width(140),
            leading: controller.flag.value
                ? const Text("")
                : const Icon(
                    IconFont.xm,
                    color: Colors.white,
                  ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color:
                        controller.flag.value ? Colors.black87 : Colors.white,
                  )),
            ],
            title: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: controller.flag.value
                  ? ScreenAdapter.width(800)
                  : ScreenAdapter.width(620),
              height: ScreenAdapter.height(96),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(230, 252, 243, 236)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, 4, 0),
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
          ),
        ));
  }
}
