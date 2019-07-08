import 'dart:io';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    new ListView(

        children: <Widget>[
          //普通构造方法
          new Image(image: AssetImage('images/meinv1.jpg')),
          //资源图片
          Image.asset(
            'images/meinv2.jpg',
            width: 260.0,
//            height: 260.0,
            repeat:ImageRepeat.noRepeat ,//当一个图片占不满容器的时候这个可以控制图片水平ImageRepeat.repeatX， 或者垂直ImageRepeat.repeatY  或者依次排列ImageRepeat.repeat，来占满   或者正常ImageRepeat.noRepeat
            fit: BoxFit.fitWidth, // 宽度不够撑满
//             fit: BoxFit.fill,
            color: Colors.green,
            colorBlendMode: BlendMode.colorBurn,
//            repeat: ImageRepeat.repeatX,
          ),
          //文件图片
//          Image.file(new File('/storage/emulated/0/Download/meinv1.jpg')),
          //网络图片
          Image.network('http://pic1.win4000.com/wallpaper/8/5121d1ba03fd9.jpg'),
          new Image.network(
            'http://pic1.win4000.com/wallpaper/2017-10-25/59f083092ed4f.jpg',
//            height: 100.0,//设置图片的高
//            width: 100.0,//设置图片的宽
            fit: BoxFit.fill,//BoxFit.fill  全图显示，显示可能拉伸或者充满  BoxFit.contain  全图显示 显示原比例，不需充满   BoxFit.cover 显示可能拉伸可能剪裁充满  BoxFit.fitWidth显示可能拉伸可能剪裁，宽度充满   BoxFit.fitHeight显示可能拉伸可能充满，高度充满  BoxFit.scaleDown  效果和contain差不多,但是此属性不允许显示超过源图片大小，可小不可大
            color: Colors.black,
            colorBlendMode:BlendMode.dstOver ,//color colorBlendMode具体效果后面再研究，我也没太弄懂,应该是一个类似混合模式的东东
            alignment: Alignment.center,//可以控制实际图片在容器内的位置
          ),
          //占位符与淡入淡出效果
          Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'http://pic1.win4000.com/wallpaper/8/5121d1ba03fd9.jpg'),
          ),
          Center(
            child: CachedNetworkImage(
//                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
                placeholder: null,
                imageUrl:
                    'http://pic1.win4000.com/wallpaper/8/5121d1ba03fd9.jpg'),
          ),
          new Directionality(
            textDirection: TextDirection.rtl,
            child: new Image.network(
              'http://pic1.win4000.com/wallpaper/2017-10-25/59f083092ed4f.jpg',
//              width: 100.0,
//              height: 100.0,
              matchTextDirection: true,//可以让图片里面的内容实现左右转换
               gaplessPlayback: true,//当ImageProvider发生变化后，重新加载图片的过程中，原图片的展示是否保留。若值为true，保留，若为false，不保留，直接空白等待下一张图片加载。
              color: Colors.lightBlue,
              colorBlendMode:BlendMode.dstOver,
            ),
          ),
        ],
      )
    ;
  }
}

//
//const Image({
//Key key,
//// 一个图片对象ImageProvider, 可设置NetworkImage(), FileImage(), MemoryImage()三种对象
//@required this.image,
//// 图片的描述, String
//this.semanticLabel,
//this.excludeFromSemantics = false,
//// 图片的宽度, double
//this.width,
//// 图片的高度, double
//this.height,
//// 图像的颜色, 用于和图片混合的颜色, 结合colorBlendMode使用
//this.color,
//// 颜色和图片混合的状态, BlendMode
//this.colorBlendMode,
//// 图像在布局中分配的空间, BoxFit
//this.fit,
//// 图像边界内对齐图像, Alignment
//this.alignment = Alignment.center,
//// 未充分填充容器时,是否重复显示图片
//this.repeat = ImageRepeat.noRepeat,
//// 九片图像的中心切点, Rect
//this.centerSlice,
//// 是否在图像的方向上绘制图像 TextDirection
//this.matchTextDirection = false,
//// 当图像提供者发生变化时，是继续显示旧图像（true）还是暂时不显示（false）
//this.gaplessPlayback = false,
//// 设置图片的过滤质量
//this.filterQuality = FilterQuality.low,
//})
//部分属性详解
//fit
//图像在布局中分配的空间, BoxFit枚举值
//
//fill: 填充满容器空间, 图片会被拉伸
//contain: 以容器的大小等比例缩放图片
//cover: 填充整个容器, 图片会被剪切
//fitWidth: 以容器的宽度, 等比例缩放图片
//fitHeight: 以容器的高度, 等比例的缩放图片
//none: 以图片的实际大小显示
//scaleDown: 居中显示, 图片不会拉伸, 以宽高中最小的尺寸为标准
//alignment
//图像边界内对齐图像, Alignment类, 不是枚举值
//
///// 定义方式为垂直方向-水平方向
//static const Alignment topLeft = Alignment(-1.0, -1.0);
//static const Alignment topCenter = Alignment(0.0, -1.0);
//static const Alignment topRight = Alignment(1.0, -1.0);
//static const Alignment centerLeft = Alignment(-1.0, 0.0);
//static const Alignment center = Alignment(0.0, 0.0);
//static const Alignment centerRight = Alignment(1.0, 0.0);
//static const Alignment bottomLeft = Alignment(-1.0, 1.0);
//static const Alignment bottomCenter = Alignment(0.0, 1.0);
//static const Alignment bottomRight = Alignment(1.0, 1.0);
//
///// 使用方式
//alignment: Alignment.topLeft,
//// 或者
//alignment: Alignment(0.0, 1.0)
//Image(
//image: NetworkImage('https://titanjun.oss-cn-hangzhou.aliyuncs.com/flutter/flutter.jpeg?x-oss-process=style/titanjun'),
//fit: BoxFit.scaleDown,
//alignment: Alignment.topLeft,
//),
//Image.network
//用于显示网络图片
//
//Image.network(
//'https://titanjun.oss-cn-hangzhou.aliyuncs.com/flutter/catimage.jpg',
//width: 100,
//height: 100,
//fit: BoxFit.scaleDown,
//alignment: Alignment.center,
//)
//网络请求Image是最常见的操作, 这里重点说明两个点
//
//缓存
//ImageCache是ImageProvider默认使用的图片缓存。ImageCache使用的是LRU的算法
//默认可以存储1000张图片。如果觉得缓存太大，可以通过设置ImageCache的maximumSize属性来控制缓存图片的数量。
//也可以通过设置maximumSizeBytes来控制缓存的大小（默认缓存大小10MB）
//CDN优化
//如果想要使用cdn优化，可以通过url增加后缀的方式实现。默认实现中没有这个点，但是考虑到cdn优化的可观收益，建议大家利用好这个优化
//
//Image.asset
//Flutter应用程序可以包含代码和 assets（有时称为资源）
//asset是打包到程序安装包中的，可在运行时访问
//常见类型的asset包括静态数据（例如JSON文件），配置文件，图标和图片（JPEG，WebP，GIF，动画WebP / GIF，PNG，BMP和WBMP）
//Flutter使用pubspec.yaml文件（位于项目根目录），来识别应用程序所需的asset