import 'package:flutter/material.dart';

class NetWorkPage extends StatefulWidget {
  final String type;
  NetWorkPage(this.type);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NetWorkPageState(type);
  }

}

class _NetWorkPageState extends State<NetWorkPage> {
  final String type;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("我是类型"+type);
  }

  _NetWorkPageState(this.type);
}
