import 'package:flutter/material.dart';
import 'package:flutter_develop/model/TabItems.dart';
import 'package:flutter_develop/page/network_page.dart';
import 'package:flutter_develop/sqflite/sqlite_page.dart';

class SavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SavePageState();
  }

}

class _SavePageState extends State<SavePage>   with SingleTickerProviderStateMixin{
  List<TabItems> tabItems = [
    TabItems("sqlite", SqlitePage()),
    TabItems("text", NetWorkPage("1")),
    TabItems("text", NetWorkPage("1")),
    TabItems("text", NetWorkPage("1")),
  ];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _tabController = new TabController(length: tabItems.length, vsync: this);
    });

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return     Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30),
          color: Colors.blue,
          child: TabBar(
              isScrollable: false,
              controller: _tabController,
              labelPadding: EdgeInsets.all(15),
              indicatorColor: Colors.green,
              unselectedLabelColor: Colors.blue,
              labelColor: Colors.pink,
              indicatorPadding: EdgeInsets.all(5),
              tabs: tabItems.map((items) {
                return Text(
                  items.name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                );
              }).toList()),
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: tabItems.map((item) {
                return item.widget;
              }).toList()),
        )
      ],
    ) ;
  }
}
