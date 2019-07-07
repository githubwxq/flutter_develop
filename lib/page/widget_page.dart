import 'package:flutter/material.dart';
import 'package:flutter_develop/model/TabItems.dart';
import 'package:flutter_develop/page/network_page.dart';
import 'package:flutter_develop/widget/container_page.dart';
import 'package:flutter_develop/widget/text_page.dart';

class WidgetPage extends StatefulWidget {
  final String type;

  WidgetPage(this.type);

  @override
  _WidgetPageState createState() => _WidgetPageState(type);
}

class _WidgetPageState extends State<WidgetPage>
    with SingleTickerProviderStateMixin {
  final String type;
  List<TabItems> tabItems = [
    TabItems("text", new TextPage()),
    TabItems("container", new ContainerPage()),
    TabItems("padding", new NetWorkPage("padding")),
    TabItems("banner", new NetWorkPage("text")),
    TabItems("viewpage", new NetWorkPage("text")),
    TabItems("editext", new NetWorkPage("text")),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _loadTabsData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return tabItems.length > 0
        ? Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.blue,
                child: TabBar(
                    isScrollable: true,
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
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  _WidgetPageState(this.type);

  void _loadTabsData() {
    setState(() {
      _tabController = new TabController(length: tabItems.length, vsync: this);
    });
  }
}
