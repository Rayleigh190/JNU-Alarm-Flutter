import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/widgets/ad_web_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenArgs {
  final String title;
  final String link;
  final String? body;

  WebViewScreenArgs({required this.title, required this.link, this.body});
}

class NoticeWebViewScreen extends AdWebViewScreen {
  static const routeName = "/webview/notice";

  const NoticeWebViewScreen(
      {super.key, required super.title, required super.link, super.body});

  @override
  State<NoticeWebViewScreen> createState() => _NoticeWebViewScreenState();
}

class _NoticeWebViewScreenState
    extends AdWebViewScreenState<NoticeWebViewScreen> {
  @override
  Future<NavigationDecision> onNavigationRequest(
      NavigationRequest request) async {
    final url = request.url;
    if (url.contains("open.kakao.com") ||
        (Platform.isAndroid && url.contains("play.google.com/store")) ||
        url.contains("download") ||
        url.contains("displayFile")) {
      final toUrl = Uri.parse(url);
      if (await canLaunchUrl(toUrl)) {
        await launchUrl(toUrl, mode: LaunchMode.externalApplication);
      }
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

  @override
  void runJavaScript(WebViewController controller) {
    // 강제 확대 가능하도록 meta 태그 수정
    controller.runJavaScript('''
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
      controller.runJavaScript('''
            document.querySelectorAll('img').forEach(img => {
              img.style.width = '100%';
              img.style.height = '100%';
              if (img.src.startsWith('http://')) {
                img.src = img.src.replace('http://', 'https://');
              }
            });
          ''');

      // table 태그가 화면에 넘치면 가로 스크롤 가능하도록 설정
      controller.runJavaScript('''
            var tables = document.getElementsByTagName("table");
            for (var i = 0; i < tables.length; i++) {
              var wrapper = document.createElement("div");
              wrapper.style.overflowX = "auto";
              wrapper.style.width = "100%";
              tables[i].parentNode.insertBefore(wrapper, tables[i]);
              wrapper.appendChild(tables[i]);
            }
          ''');

      // 최하단 목록 버튼 안 보이도록 설정
      // Play Store 거부 대상
      controller.runJavaScript('''
            var elements = document.getElementsByClassName('btn-deco color2');
            if (elements.length > 0) {
               elements[0].style.display = 'none';
            }
          ''');
    }
  }
}
