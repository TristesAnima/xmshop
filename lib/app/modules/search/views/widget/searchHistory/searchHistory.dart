import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/controllers/search_controller.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

class SearchHistory extends GetView<SearchController> {
  const SearchHistory({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "搜索历史",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: ScreenAdapter.fs(42)),
            ),
            const Icon(Icons.delete_outline)
          ],
        ),
        Wrap(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: ScreenAdapter.height(32),
                  right: ScreenAdapter.height(32)),
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.height(32),
                  ScreenAdapter.height(16),
                  ScreenAdapter.height(32),
                  ScreenAdapter.height(16)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(10))),
              child: Text("手机"),
            ),
          ],
        )
      ],
    );
  }
}
