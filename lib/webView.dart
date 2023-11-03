import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class web_View extends StatelessWidget {

   final String  url;
   web_View(this.url);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
      ),
      body: WebView(
       initialUrl: url,
    ),
    );
  }
}
