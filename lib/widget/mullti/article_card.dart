import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_develop/model/TabItems.dart';
import 'package:flutter_develop/widget/single/webview.dart';

class ArticleCard extends StatefulWidget {
  final TabItems tabItems;

  ArticleCard(this.tabItems);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ArticleCardState();
  }
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        return Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return WebView(url: "https://www.jianshu.com/p/c8509b6a7223?utm_source=oschina-app",title: "测试简书",);
        }));
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 10, right: 10, top: 8),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //负轴从左往右
            children: <Widget>[
              Container(
                child: Text(
                  widget.tabItems.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.red, fontSize: 16),

                ),

              ),

              Container(
                margin: EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  widget.tabItems.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),

              ),

              Row(
                children: <Widget>[
                  _itemTags(widget.tabItems.name),
                  _itemTags(widget.tabItems.name),
                ],


              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      '作者：${widget.tabItems.name}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Text(
                    widget.tabItems.name,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )

            ],


          ),


        ),

      ),


    );
  }

  _itemTags(String name) {
    return GestureDetector(
      child: Container(
        height: 22,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 10,right: 10),
        padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
      child: Text(name,style: TextStyle(
        fontSize: 12,
        backgroundColor: Colors.black,
        color:Colors.white


      ),),
        
      ),
      
      
      
    );
  }

}