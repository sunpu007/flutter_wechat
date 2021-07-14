import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  static const String routerName = 'webview';

  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  String _pageTitle = 'flutter微信';

  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    String initialUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppTheme.appBarHeight),
        child: AppBar(
          title: Text(_pageTitle),
        ),
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          setState(() {
            _controller = controller;
          });
        },
        onPageFinished: (String value) {
          _controller!.getTitle().then((value) {
            setState(() {
              _pageTitle = value.toString();
            });
          });
          _controller!.evaluateJavascript('document.cookie = "vue_admin_template_token=eyJhZG1pbklkIjoxLCJ1c2VybmFtZSI6ImFkbWluIiwiYXZhdGFyVXJsIjoiaHR0cHM6Ly9vc3MtYmxvZy5teWplcnJ5LmNuL2F2YXRhci9ibG9nLWF2YXRhci5qcGcifQ==; path=/');
        },
      ),
    );
  }
}
