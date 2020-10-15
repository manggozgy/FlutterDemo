import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class webView extends StatefulWidget {
  int index;
  String title;
  String id;
  webView({this.index,this.title,this.id});

  @override
  _webViewState createState() => _webViewState();
}

class _webViewState extends State<webView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title,style: TextStyle(fontSize: 16),),
      ),
          body: WebView(
   initialUrl: "${widget.id}",
   //JS执行模式 是否允许JS执行
   javascriptMode: JavascriptMode.unrestricted,
 )
    );
  }
}