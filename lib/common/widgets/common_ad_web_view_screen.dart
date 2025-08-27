import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/widgets/ad_web_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonAdWebViewScreen extends AdWebViewScreen {
  static const routeName = "/webview/common-ad";

  const CommonAdWebViewScreen(
      {super.key, required super.title, required super.link, super.body});

  @override
  State<StatefulWidget> createState() => _CommonAdWebViewScreenState();
}

class _CommonAdWebViewScreenState
    extends AdWebViewScreenState<CommonAdWebViewScreen> {
  @override
  Future<NavigationDecision> onNavigationRequest(
      NavigationRequest request) async {
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
  }

  @override
  void runJavaScript(WebViewController controller) {}
}
