import 'package:flutter/material.dart';

//链接：https://www.jianshu.com/p/2d6bde7fbdda

class TextFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ControllerText();
  }
}

class ControllerText extends State<TextFieldPage> {
  TextEditingController _textEditingControllerTel = TextEditingController();
  TextEditingController _textEditingControllerPwd = TextEditingController();

  /**
   * 控制输入框弹起收起
   */
  FocusNode focusNode1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              autofocus: true,
              focusNode: focusNode1,
              //关联focusNode1
              maxLines: 2,
//              textInputAction: TextInputAction.search,
              controller: _textEditingControllerTel,
              decoration: InputDecoration(
                  labelText: "请输入手机号",
                  icon: Icon(Icons.phone),
                  helperText: "手机号只能输入11位哦",
                  labelStyle: TextStyle(color: Colors.green)),
              obscureText: false,
              keyboardType: TextInputType.phone,
            ),
            margin: EdgeInsets.only(top: 25),
          ),
          Container(
            child: TextField(
              controller: _textEditingControllerPwd,
              decoration:
                  InputDecoration(labelText: "请输入密码", icon: Icon(Icons.lock)),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            margin: EdgeInsets.only(top: 10),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  onPressed: loginObserver(),
                  colorBrightness: Brightness.light,
                  textTheme: ButtonTextTheme.primary,
                  child: new Text(
                    "登录",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ))
              ],
            ),
          ),
          RaisedButton(
            child: Text('赋值'),
            onPressed: () {
//              focusNode1.f();
              setState(() {
                _textEditingControllerTel.text = "https://www.titanjun.top";
              });
            },
          ),
          RaisedButton(
            child: Text('取值'),
            onPressed: () {
              focusNode1.unfocus();
              setState(() {});
            },
          ),
          Text(_textEditingControllerPwd.text)
        ],
      ),
    );
  }

  loginObserver() {}
}

//const TextField({
//Key key,
//// 编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
//this.controller,
//// 用于控制`TextField`是否占有当前键盘的输入焦点, 使我们和键盘交互的`handle`
//this.focusNode,
//
//// 用于控制`TextField`的外观显示，如提示文本、背景颜色、边框等
//this.decoration = const InputDecoration(),
//// 键盘类型
//TextInputType keyboardType,
//// 决定键盘右下角按钮显示的内容
//this.textInputAction,
//// 设置什么情况下使用大写字母, 默认不使用大写字母
//this.textCapitalization = TextCapitalization.none,
//
//// 正在编辑的文本样式, `TextStyle`
//this.style,
//// 输入框文本的对其方式
//this.textAlign = TextAlign.start,
//// 输入框文本的其实位置
//this.textDirection,
//
//// 是否自动获取焦点, 默认`false`
//this.autofocus = false,
//// 是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换, 默认`false`
//this.obscureText = false,
//// 是否自动校验, 默认`false`
//this.autocorrect = true,
//
//// 输入框能输入的最大行数
//this.maxLines = 1,
//// 输入框能输入的最多字符个数
//this.maxLength,
//// 达到最大长度(`maxLength`)时是否阻止输入, 默认`true`: 不能继续输入, `false`可以继续输入
//this.maxLengthEnforced = true,
//
//// 输入文本发生变化时的回调
//this.onChanged,
//// 点击键盘完成按钮时触发的回调，该回调没有参数，(){}
//this.onEditingComplete,
//// 点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
//this.onSubmitted,
//
//// 对输入文本的校验
//this.inputFormatters,
//// 输入框是否可用, `false`则输入框会被禁用
//this.enabled,
//
//// 光标的宽度
//this.cursorWidth = 2.0,
//// 光标的圆角
//this.cursorRadius,
//// 光标的颜色
//this.cursorColor,
//
//// 键盘的外观, Brightness.light和dark
//this.keyboardAppearance,
//// 当TextField滚动时, 设置文本字段在滚动后的位置与可滚动项的边缘的距离
//this.scrollPadding = const EdgeInsets.all(20.0),
//// 长按输入的文本, 设置是否显示剪切，复制，粘贴按钮, 默认是显示的
//this.enableInteractiveSelection = true,
//// 点击输入框时的回调(){}
//this.onTap,
//})

//InputDecoration 相关属性含义
//
//const InputDecoration({
//// 接收Widget, 在输入框左侧显示的图片
//this.icon,
//
//// String, 输入框的描述, 当输入框获取焦点时默认会浮动到上方
//this.labelText,
//// TextStyle, 样式
//this.labelStyle,
//
//// 辅助文本, 位于输入框下方，如果errorText不为空的话，则helperText不显示
//this.helperText,
//this.helperStyle,
//
///// 提示文本，位于输入框内部
//this.hintText,
//this.hintStyle,
//
//// 错误信息提示文本
//this.errorText,
//this.errorStyle,
//// errorText显示的最大行数
//this.errorMaxLines,
//// errorText不为空，输入框没有焦点时要显示的边框
//this.errorBorder,
//
//// labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
//this.hasFloatingPlaceholder = true,
//// 改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
//this.isDense,
//// 内间距
//this.contentPadding,
//
//// 位于输入框内部起左侧置的图标
//this.prefixIcon,
//// 预先填充在输入框左侧的Widget,跟prefixText同时只能出现一个
//this.prefix,
////预填充在输入框左侧的文本, 不可修改删除，例如手机号前面预先加上区号等
//this.prefixText,
//this.prefixStyle,
//
//// 位于输入框内部右侧位置的图标
//this.suffixIcon,
//// 预先填充在输入框右侧的Widget,跟suffixText同时只能出现一个
//this.suffix,
//// 预填充在输入框右侧的文本, 不可修改删除
//this.suffixText,
//this.suffixStyle,
//
//// 位于右下方显示的文本，常用于显示输入的字符数量
//this.counterText,
//this.counterStyle,
//
//// 相当于输入框的背景颜色
//this.fillColor,
//// 如果为true，则输入使用fillColor指定的颜色填充
//this.filled,
//
//// 输入框有焦点时的边框,如果errorText不为空的话，该属性无效
//this.focusedBorder,
//// errorText不为空时，输入框有焦点时的边框
//this.focusedErrorBorder,
//// 输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
//this.disabledBorder,
//// 输入框可用时显示的边框，如果errorText不为空的话，该属性无效
//this.enabledBorder,
//// 正常情况下的边框
//this.border,
//// 输入框是否可用
//this.enabled = true,
//// counterText的语义标签, 如果赋值将替换counterText, 但是我试了好像没什么效果
//this.semanticCounterText,
//})
//
//keyboardType 相关属性和含义
//TextInputType
//含义
//text
//文本输入键盘
//multiline
//多行文本，需和maxLines配合使用(设为null或大于1)
//number
//纯数字键盘
//phone
//电话号码输入键盘会弹出数字键盘并显示* #
//datetime
//日期输入键盘, Android上会显示: -
//emailAddress
//电子邮件地址,会显示@ .
//
//
//
//textInputAction
//决定键盘右下角按钮显示的内容, TextInputAction枚举值
//
//
//
//textInputAction
//样式
//
//
//
//
//none
//不支持iOS
//
//
//
//unspecified
//显示return
//
//
//
//done
//显示Done
//
//
//
//go
//显示Go
//
//
//
//search
//显示Search
//
//
//
//send
//显示Send
//
//
//
//next
//显示Next
//
//
//
//previous
//不支持iOS
//
//
//
//continueAction
//显示Continue
//
//
//
//join
//显示Join
//
//
//
//route
//显示Route
//
//
//
//emergencyCall
//显示Emergency Call
//
//
//
//
//newline
//textCapitalization
//设置什么状态下使用大写字母键盘TextCapitalization枚举值
//enum TextCapitalization {
//// 每个单词的第一个字母使用大写字母
//words,
//// 默认为每个句子的第一个字母使用大写键盘。
//sentences,
//// 每个字符默认使用大写键盘
//characters,
///// 不使用大写字母键盘
//none,
//}
//
//textAlign
//输入框内文本在水平方向的对齐方式
//// 默认值
//this.textAlign = TextAlign.start
//
//// 所有枚举值
//left: 左对齐
//right: 右对齐
//center: 居中
//start: 起始位置, 和textDirection有关
//end: 终点位置, 和textDirection有关
//justify: 文本的拉伸行，以软换行符结束，以填充容器的宽度
//
//textDirection
//决定文本是从右向左对其还是从左向右对齐
//enum TextDirection {
//rtl,
//ltr,
//}
//
//inputFormatters
//
//用于限制输入的内容，接收一个TextInputFormatter类型的集合
//
//TextInputFormatter是一个抽象类, 官方给我们提供了他的三个子类，分别是
//
//
//WhitelistingTextInputFormatter: 白名单校验，也就是只允许输入符合规则的字符
//
//BlacklistingTextInputFormatter: 黑名单校验，除了规定的字符其他的都可以输入
//
//LengthLimitingTextInputFormatter: 长度限制，跟maxLength作用类似
//
//
//构造函数如下
//
//// 白名单校验
//WhitelistingTextInputFormatter(this.whitelistedPattern)
//// 黑名单校验
//BlacklistingTextInputFormatter(
//this.blacklistedPattern, {
//// 当输入禁止输入的字符时候, 会被替换成设置的replacementString字符
//this.replacementString = '',
//})
//// 长度校验
//LengthLimitingTextInputFormatter(this.maxLength)
//
//// whitelistedPattern和blacklistedPattern都是Pattern类型的,
//abstract class RegExp implements Pattern {
//external factory RegExp(String source,
//{bool multiLine: false, bool caseSensitive: true});
//}
//
//使用介绍
//// 白名单
//inputFormatters: [
//// 只能输入数字
//WhitelistingTextInputFormatter.digitsOnly,
//// 是能输入小写字母
//WhitelistingTextInputFormatter(RegExp("[a-z]"))
//],
//
//// 黑名单
//inputFormatters: [
//// 不能输入回车符
//BlacklistingTextInputFormatter.singleLineFormatter,
//// 不能输入小写字母
//BlacklistingTextInputFormatter(RegExp("[a-z]"), replacementString: '-')
//],
//
//// 字符限制
//[LengthLimitingTextInputFormatter(10)]
//
//// 也可是三种或两种一起使用一起使用
//inputFormatters: [
//// 不能输入小写字母
//BlacklistingTextInputFormatter(RegExp("[a-z]")),
//// 限制输入10个字符
//LengthLimitingTextInputFormatter(10)
//],
//
//光标设置
//设置输入框光标的样式
//// 光标的宽度
//this.cursorWidth = 2.0,
//// 光标的圆角
//this.cursorRadius,
//// 光标的颜色
//this.cursorColor,
//
//// 示例如下
//cursorWidth: 10,
//cursorColor: Colors.cyan,
//cursorRadius: Radius.circular(5),
//
//enableInteractiveSelection
//长按输入的文本, 设置是否显示剪切，复制，粘贴按钮, 默认是显示的
//// 默认值
//this.enableInteractiveSelection = true,
//
//作者：TitanCoder
//链接：https://www.jianshu.com/p/2d6bde7fbdda
//来源：简书
//简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。