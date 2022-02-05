// ignore: unused_import
// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        // GÜNCELLEME
        // Bu link birde icon güncellenmeli
        initialUrl: 'http://dmbsport.net/',
        onWebViewCreated: (WebViewController webViewController) {
          setState(() {
            _controller = webViewController;
          });
        },
        gestureNavigationEnabled: true,
        geolocationEnabled: false,
      ),
      bottomNavigationBar: _controller != null
          ? _WebViewNavigationBar(controller: _controller!)
          : null,
    );
  }

  //This method handles Tap on BottomNavigationItems & set the current index to our variable
  void onTabTapped(int index) async {
    setState(() async {
      switch (index) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }
}

class _WebViewNavigationBar extends StatelessWidget {
  final WebViewController controller;

  scanBarcodeNormal(WebViewController controller) async {
    var _scanBarcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", 'Çıkış', true, ScanMode.BARCODE);
    // ignore: deprecated_member_use
    await controller.evaluateJavascript("barcode('$_scanBarcode')");
  }

  const _WebViewNavigationBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 64,
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => controller.goBack())),
              Expanded(
                flex: 3,
                child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => controller.goForward()),
              ),
              Expanded(
                flex: 3,
                child: IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () => controller.reload(),
                ),
              ),
              Expanded(
                flex: 3,
                child: IconButton(
                  icon: Icon(Icons.qr_code_2),
                  onPressed: () async => {scanBarcodeNormal(controller)},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
