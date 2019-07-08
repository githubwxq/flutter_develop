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



// 相关属性介绍
//1. inherit: 为false时不显示
//
//2. color: 字体颜色
//
//3. fontSize: 字体大小, 默认是14.0
//
//4. fontWeight: 字体的粗体, FontWeight.w500
//
//5. fontStyle: 字体的样式
//normal正常 italic 斜体
//
//6. letterSpacing: 字符间距
//
//7. wordSpacing: 单词间距
//
//8. textBaseline
//alphabetic：用于对齐字母字符底部的水平线
//ideographic：用于对齐表意字符的水平线
//
//9. height: 用在Text控件上的时候，会乘以fontSize做为行高,
//
//10. locale: 国际化
//
//11. foreground: 用paint来渲染text，也可以用他来改变字体颜色等
//
//12. background: 背景颜色
//
//13. decoration:
//下划线 underline、 删除线 lineThrough、上划线 overline，默认是无 none
//
//14. decorationStyle: decoration线的样式
//solid: 直线, double: 两条线, dotted: 短虚线, dashed: 长虚线, wavy: 波浪线
//
//15. decorationColor: decoration线的颜色
//
//16. debugLabel: 文本样式的描述, 该属性只在调试中维护
//
//17. fontFamily和package（自定义字体的时候用的到，后面再详解）


//使用样式示例
//
//style: TextStyle(
//inherit: true,
//color: Colors.red,
//fontSize: 50,
//fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic,
//letterSpacing: 2,
//wordSpacing: 5,
//textBaseline: TextBaseline.alphabetic,
//height: 2,
//locale: Locale('CH'),
//decoration: TextDecoration.lineThrough,
//decorationColor: Colors.blue,
//decorationStyle: TextDecorationStyle.wavy,
//),
//textAlign
//文本显示方向
//
//left: 居左显示
//center: 居中显示
//right: 居右显示
//justify: 文本的拉伸行，其末尾用软换行符填充宽度
//start: 对齐容器前缘的文本。
//对于从左到右的文本([TextDirection.ltr])，这是左边缘。
//对于从右到左的文本([TextDirection.rtl])，这是右边缘。
//end: 对齐容器尾部边缘的文本。
//对于从左到右的文本([TextDirection.ltr])，这是右边缘。
//对于从右到左的文本([TextDirection.rtl])，这是左边缘。
//textDirection
//和上述TextAlign.start和TextAlign.end一样
//
//softWrap
//文本是否能换行,bool类型
//
//overflow
//用来指定超出文本的表示方式，是截断文本啊还是用三个点显示等
//
//ellipsis: ...形式显示
//clip: 直接截断
//fade: 效果和clip一样
//maxLines
//用来指定文本最多显示多少行
//
//textScaleFactor
//文本字体的缩放倍数，如：1.5则在默认字体上变成1.5倍大小字体，0.5则是0.5倍
//
//Text构造函数
//child: Text(
//// 需要显示的文字
//'titanjun.top' * 3,
//textAlign: TextAlign.left,
//textDirection: TextDirection.ltr,
//locale: Locale('CH'),
//maxLines: 1,
//overflow: TextOverflow.fade,
//style: TextStyle(
//inherit: true,
//color: Colors.red,
//fontSize: 50,
//fontWeight: FontWeight.bold,
//fontStyle: FontStyle.italic,
//letterSpacing: 2,
//wordSpacing: 5,
//textBaseline: TextBaseline.alphabetic,
//height: 2,
//locale: Locale('CH'),
//decoration: TextDecoration.lineThrough,
//decorationColor: Colors.blue,
//decorationStyle: TextDecorationStyle.wavy,
//),
//),
//Text.rich构造函数
//这个构造函数和iOS中用到的富文本类似
//
//child: Text.rich(
//TextSpan(
//text: '博客地址: ',
//children: [
//TextSpan(
//text: 'https://',
//style: TextStyle(color: Colors.red)
//),
//TextSpan(
//text: 'titanjun.top',
//style: TextStyle(color: Colors.blue),
//),
//TextSpan(
//text: '欢迎访问',
//style: TextStyle(color: Colors.orange)
//),
//]
//),
//),