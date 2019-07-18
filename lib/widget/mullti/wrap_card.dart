import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_develop/model/TabItems.dart';
import 'package:flutter_develop/widget/single/webview.dart';


class WrapCard extends StatefulWidget {
  final TabItems tabItems;

  WrapCard(this.tabItems);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WrapCardState();
  }
}

class _WrapCardState extends State<WrapCard> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10,bottom: 10,left: 18),
          child: Text("wxq",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        Wrap(
          children: <Widget>[
             Padding(
//               padding: EdgeInsets.fromLTRB(left, top, right, bottom),


             )



          ],

        )
        
        
        
        
        
      ],
      
      
      
    );
  }

}