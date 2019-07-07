
import 'package:flutter/material.dart';
class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 50),
            child: Text('hello wxq',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.green,
              ),),
            //对齐
            alignment: Alignment.centerLeft,
//            alignment: Alignment.topCenter,
            //内间距
            padding: EdgeInsets.all(30.0),
            //颜色
//            color: Colors.yellow,
            width: 200.0,
            height: 100.0,
            //背景装饰---于color冲突
            decoration: BoxDecoration(
              color: Colors.brown,
              //渐变
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.green, Colors.blue]),
              border: Border.all(
                width: 5.0,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            //前景装饰
//            foregroundDecoration: BoxDecoration(
//              color: Colors.brown,
//
//              //边框的角度
//              borderRadius: BorderRadius.all(Radius.circular(5.0)),
//            ),
            //高宽的限制
//            constraints: BoxConstraints(maxWidth: 100.0),
//            transform:Matrix4.rotationZ(1.0),

          ),
          new Text("1111111",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
          ),

        ],
      );
  }
}