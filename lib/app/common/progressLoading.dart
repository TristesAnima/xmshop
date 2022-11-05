import 'package:flutter/cupertino.dart';

class Loading extends StatelessWidget {
  final bool? loading;

  const Loading({super.key, this.loading = true});

  @override
  Widget build(BuildContext context) {
    return loading!
        ? const Center(child: CupertinoActivityIndicator())
        : const Center(
            child: Text("没有数据了哦 ！"),
          );
  }
}
