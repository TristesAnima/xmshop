import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/modules/user/views/widget/book.dart';
import 'package:xmshop/app/modules/user/views/widget/bottomPoster.dart';
import 'package:xmshop/app/modules/user/views/widget/poster.dart';
import 'package:xmshop/app/modules/user/views/widget/userAvatar.dart';
import 'package:xmshop/app/modules/user/views/widget/userMoney.dart';
import 'package:xmshop/app/services/iconfont.dart';
import '../../../services/screenAdapter.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("会员码"),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.qr_code_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.message_outlined)),
            ],
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(28)),
        children: const [
          UserAvatar(),
          UserMoney(),
          UserPoster(),
          UserBook(),
          UserBottomPoster()
        ],
      ),
    );
  }
}
