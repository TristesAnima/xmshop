import 'package:flutter/material.dart';
import '../services/screenAdapter.dart';

class PassTextFiled extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;

  const PassTextFiled({super.key, required this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.height(140),
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      padding: EdgeInsets.only(left: ScreenAdapter.width(40)),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        // autofocus: true,
        style: TextStyle(fontSize: ScreenAdapter.fs(48)),
        keyboardType: TextInputType.number, //默认弹出数字键盘
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none //去掉下划线
                ),
        onChanged: onChanged,
      ),
    );
  }
}
