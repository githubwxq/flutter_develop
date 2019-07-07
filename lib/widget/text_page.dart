import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          new Container(
            child: new Text(
              'dong nao dfsajoewihs fasoijfowej  fojasfioe ',
              style: new TextStyle(
                //是否继承
                inherit: false,
                //字体颜色
                color: Colors.red,
                //字体大小
                fontSize: 30.0,
                //文字粗细
                fontWeight: FontWeight.w100,
                //斜体
                fontStyle: FontStyle.italic,
                //字母的间隙
                letterSpacing: 2.0,
                //单词的间隙
                wordSpacing: 2.0,
                //行高，fontSize*height
                height: 3.0,
                //划线
                decoration: TextDecoration.lineThrough,
                //划线颜色
                decorationColor: Colors.green,
                //划线类型
                decorationStyle: TextDecorationStyle.dotted,
                //自定义字体
                fontFamily: 'BlackAndWhite',
              ),
              //对齐方式：justify,两端对齐
//              textAlign: TextAlign.justify,
              //是否自动换行
//              softWrap: false,
              //超出文本的一个显示形式
              overflow: TextOverflow.ellipsis,
              //fontSize*倍率
              textScaleFactor: 2.0,
              maxLines: 1,
            ),
            color: Colors.yellow,
          ),
          new Text.rich(
            new TextSpan(
              text: 'text span',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30.0,
              ),
              recognizer: TapGestureRecognizer()..onTap = (){
                var alert = new AlertDialog(
                  title: Text('text dialog'),
                  content: Text('text content'),
                );
                showDialog(context: context,builder:(BuildContext context) => alert);
              },
            ),
          ),
        ],
      )
    ;
  }
}
