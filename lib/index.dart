import 'package:flutter/material.dart';
import 'package:flutter_develop/page/widget_page.dart';


import 'navigationbar/navigation_bar_tab.dart';
import 'package:flutter_develop/page/login_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter开发工具收集",
      theme: ThemeData(fontFamily: 'noto', primaryColor: Colors.blue),
      home: NavigationBarTab(),
      routes: {'/HomePage': (context) => WidgetPage("1"),
        '/LoginPage':(context) =>LoginPage(),
        '/RegisterPage':(context) =>WidgetPage("3")},
    );
  }
}
