import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String link;
  final String? body;

  const WebViewScreen(
      {super.key, required this.title, required this.link, this.body});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  String currentUrl = "";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();

    _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageFinished: (String url) {
          // 강제 확대 가능하도록 meta 태그 수정
          _controller.runJavaScript('''
          var meta = document.querySelector('meta[name="viewport"]');
          if (meta) {
            meta.setAttribute('content', 'width=device-width, initial-scale=1, user-scalable=yes');
          } else {
            var newMeta = document.createElement('meta');
            newMeta.name = "viewport";
            newMeta.content = "width=device-width, initial-scale=1, user-scalable=yes";
            document.head.appendChild(newMeta);
          }
        ''');

          if (widget.link.contains("jnu.ac.kr")) {
            // 이미지 태그 크기를 100%로 변경
            // http를 https로 변경
            _controller.runJavaScript('''
            document.querySelectorAll('img').forEach(img => {
              img.style.width = '100%';
              img.style.height = '100%';
              if (img.src.startsWith('http://')) {
                img.src = img.src.replace('http://', 'https://');
              }
            });
          ''');

            // table 태그가 화면에 넘치면 가로 스크롤 가능하도록 설정
            _controller.runJavaScript('''
            var tables = document.getElementsByTagName("table");
            for (var i = 0; i < tables.length; i++) {
              var wrapper = document.createElement("div");
              wrapper.style.overflowX = "auto";
              wrapper.style.width = "100%";
              tables[i].parentNode.insertBefore(wrapper, tables[i]);
              wrapper.appendChild(tables[i]);
            }
          ''');
          }
        },
        onUrlChange: (change) {
          currentUrl = change.url ?? widget.title;
        },
      ),
    );

    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.enableZoom(true);
    _controller.loadRequest(
      Uri.parse(widget.link),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final url = Uri.parse(currentUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            icon: const Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () async {
                if (await _controller.canGoBack()) {
                  _controller.goBack();
                }
              },
              icon: Icon(
                Icons.chevron_left,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (await _controller.canGoForward()) {
                  _controller.goForward();
                }
              },
              icon: Icon(
                Icons.chevron_right,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () {
                _controller.reload();
              },
              icon: Icon(
                Icons.refresh,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (widget.body != null) {
                  await Share.share("[전대알림]\n${widget.body}\n$currentUrl");
                } else {
                  await Share.share("[전대알림]\n$currentUrl");
                }
              },
              icon: Icon(
                Icons.ios_share,
                color: isDark ? Colors.white54 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
