import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMASKARA Admin',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final webViewKey = UniqueKey();
  WebViewController? _webViewController;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"MASKARA" ADMIN'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _webViewController?.goBack();
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              _webViewController?.goForward();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _webViewController?.reload();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebView(
            key: webViewKey,
            initialUrl: 'http://syaidandhika.my.id/Login',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
