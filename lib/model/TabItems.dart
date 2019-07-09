import 'package:flutter/material.dart';
class TabItems {
  String name;
  Widget widget;
  TabItems(this.name,this.widget);
  TabItems.single(this.name);
}