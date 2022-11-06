import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class CommonAppBar extends GetView with PreferredSizeWidget {
  final double? height;
  final bool? hideMsg;
  final String? keyWords;

  CommonAppBar(
      {super.key, this.height = 180, this.hideMsg = false, this.keyWords = ''});

  @override
  Size get preferredSize =>
      Size(ScreenAdapter.width(1080), ScreenAdapter.height(height!));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          if (!hideMsg!) {
            Get.toNamed('/search');
          }
        },
        child: Container(
            width: ScreenAdapter.width(hideMsg! ? 900 : 840),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(246, 246, 246, 1)),
            child: InkWell(
              onTap: () => Get.offAndToNamed('/search'),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, 4, 0),
                    child: const Icon(Icons.search, color: Colors.black54),
                  ),
                  Text(
                    keyWords!,
                    style: TextStyle(
                        fontSize: ScreenAdapter.fs(32), color: Colors.black45),
                  ),
                ],
              ),
            )),
      ),
      actions: hideMsg!
          ? const [Text("")]
          : [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_outlined,
                    color: Colors.black87,
                  )),
            ],
    );
  }
}
