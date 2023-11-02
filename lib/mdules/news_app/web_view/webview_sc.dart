import 'package:news_app/mdules/news_app/business/business_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../science/scienc_screen.dart';

class webview_screen extends StatelessWidget {
  final String url;
  const webview_screen(this.url,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
          initialUrl:url,
        ),

    );
  }
}
