import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonAdWebViewScreen extends StatefulWidget {
  static const routeName = "/webview/common-ad";
  final String title;
  final String link;
  final String? body;

  const CommonAdWebViewScreen(
      {super.key, required this.title, required this.link, this.body});

  @override
  State<CommonAdWebViewScreen> createState() => _CommonAdWebViewScreenState();
}

class _CommonAdWebViewScreenState extends State<CommonAdWebViewScreen> {
  bool _isLoading = true;
  late WebViewController _controller;
  String currentUrl = "";

  // AdMob Start
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final String _debugAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';
  final String _releaseAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4183402691727093/6476970284'
      : 'ca-app-pub-4183402691727093/5410662598';
  String get _adUnitId => kDebugMode ? _debugAdUnitId : _releaseAdUnitId;

  /// Loads a banner ad.
  void _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.sizeOf(context).width.truncate());

    _bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size as AdSize,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }
  // AdMob End

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
        onPageStarted: (url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (String url) {
          // 강제 확대 가능하도록 meta 태그 수정
          //   _controller.runJavaScript('''
          //   var meta = document.querySelector('meta[name="viewport"]');
          //   if (meta) {
          //     meta.setAttribute('content', 'width=device-width, initial-scale=1, user-scalable=yes');
          //   } else {
          //     var newMeta = document.createElement('meta');
          //     newMeta.name = "viewport";
          //     newMeta.content = "width=device-width, initial-scale=1, user-scalable=yes";
          //     document.head.appendChild(newMeta);
          //   }
          // ''');
          setState(() {
            _isLoading = false;
          });
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAd();
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
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
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
          // AdMob Start
          if (_bannerAd != null && _isLoaded)
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            )
          // AdMob End
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
