import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget{
  final String url;
  final String title;

  const WebView({Key key,this.url,this.title}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }

}

class _WebViewState extends State<WebView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: GestureDetector(
          onTap: (){
           return Navigator.of(context).pop();
          },
          child: Container(child: Icon(Icons.close),padding: EdgeInsets.all(5),),
        ),
      ),

      url: widget.url,
      withZoom: true,
      hidden: true,
      initialChild: Center(child: CircularProgressIndicator()),



    );
  }

}