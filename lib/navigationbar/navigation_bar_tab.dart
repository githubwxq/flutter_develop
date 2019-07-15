import 'package:flutter/material.dart';
import 'package:flutter_develop/page/widget_page.dart';
import 'package:flutter_develop/page/network_page.dart';
import 'package:flutter_develop/page/save_page.dart';

class NavigationBarTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavigationBarTabState();
  }
}

class _NavigationBarTabState extends State<NavigationBarTab> {
  var _currentIndex = 0;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _createBottomNavigationBarItem(Icons.home, Colors.grey, Colors.blue, 0, '控件'),
          _createBottomNavigationBarItem(
              Icons.school, Colors.grey, Colors.blue, 1, '网络'),
          _createBottomNavigationBarItem(Icons.format_indent_decrease,
              Colors.grey, Colors.blue, 2, '存储'),
          _createBottomNavigationBarItem(
              Icons.picture_in_picture_alt, Colors.grey, Colors.blue, 3, '三方库'),
        ],
        onTap: _onTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
      ),

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: _onPageChange,
        children: <Widget>[WidgetPage("1"), NetWorkPage("2"), SavePage(), NetWorkPage("4")],
      ),

    );
  }

  _createBottomNavigationBarItem(IconData icon, Color unSelect,
      Color selectColor, int index, String tabName) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: unSelect,
        ),
        title: Text(
          tabName,
          style: TextStyle(
            color: _currentIndex == index ? Colors.blue : Colors.grey,
          ),
        ),
        activeIcon: Icon(
            icon,
            color: selectColor,
        ));
  }

  void _onTap(int index) {
    setState(() {
      _controller.jumpToPage(index);
      _currentIndex = index;
    });
  }

  void _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
