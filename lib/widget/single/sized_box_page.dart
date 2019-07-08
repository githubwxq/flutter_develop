import 'package:flutter/material.dart';

//没限制时：强制设置child的宽高，没设置宽高，则按child自己的尺寸来，都没有则尺寸为0
//有限制时：按限制来渲染
//Container跟它效果一样
class SizedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizedBox'),
      ),
      body: Container(
        color: Colors.yellow,
        child: SizedBox(
//          index: 1
        ),
      ),
    );
  }
}
