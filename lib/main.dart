import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(webapp());
}

class webapp extends StatelessWidget {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My WebView",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("My WebView App"),
        // ),
        body: SafeArea(
          child: WillPopScope(
            onWillPop: () async {
              if(await _controller.canGoBack()) {
                _controller.goBack();
                return false;
              }
              else {
                return true;
              }
            },
            child: Center(
              child: WebView(
                initialUrl: "https://sunrisenews.co.in",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

