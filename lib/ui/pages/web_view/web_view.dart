import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_wechat/core/utils/utils.dart';
import 'package:flutter_wechat/ui/shared/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_wechat/core/extension/double_extension.dart';

class WebViewPage extends StatefulWidget {
  static const String routerName = 'webview';

  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  String _pageTitle = 'flutter微信';

  int _progress = 0;

  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    String initialUrl = ModalRoute.of(context)!.settings.arguments as String;

    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppTheme.appBarHeight),
          child: AppBar(
            title: Text(_pageTitle),
          ),
        ),
        backgroundColor: checkUrl(initialUrl) ? null : Colors.white,
        body: _buildBody(context, initialUrl),
      ),
    );
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller!.canGoBack()) {
      _controller!.goBack();
      return Future.value(false);
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text("No back history item")),
      // );
      return Future.value(true);
    }
  }

  Widget _buildBody(BuildContext context, String initialUrl) {
    if (checkUrl(initialUrl)) {
      return _buildWebView(context, initialUrl);
    }
    return Container(
      padding: EdgeInsets.all(43.0.px),
      child: Text(initialUrl),
    );
  }

  Widget _buildWebView(BuildContext context, String initialUrl) {
    return Stack(
      children: [
        WebView(
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
          onProgress: (int progress) {
            setState(() {
              _progress = progress;
            });
          },
        ),
        if (_progress < 100) Container(
          width: MediaQuery.of(context).size.width * (_progress / 100),
          height: 6.0.px,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(3.0.px),
              bottomRight: Radius.circular(3.0.px),
            ),
          ),
        ),
      ],
    );
  }
}
