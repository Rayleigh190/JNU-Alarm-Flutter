import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWsebViewScreen extends StatefulWidget {
  static const routeName = "/webview/common";
  final String title;
  final String link;
  final String? body;

  const CommonWsebViewScreen(
      {super.key, required this.title, required this.link, this.body});

  @override
  State<CommonWsebViewScreen> createState() => _CommonWsebViewScreenState();
}

class _CommonWsebViewScreenState extends State<CommonWsebViewScreen> {
  late WebViewController _controller;
  String currentUrl = "";

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();

    _controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (request) async {
          final url = request.url;
          if (url.contains("open.kakao.com") ||
              (Platform.isAndroid && url.contains("play.google.com/store"))) {
            final toUrl = Uri.parse(url);
            if (await canLaunchUrl(toUrl)) {
              await launchUrl(toUrl, mode: LaunchMode.externalApplication);
            }
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
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
        },
        onUrlChange: (change) {
          currentUrl = change.url ?? widget.link;
        },
      ),
    );

    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.enableZoom(true);
    if (widget.link.isNotEmpty) {
      _controller.loadRequest(
        Uri.parse(widget.link),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
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
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
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
