import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jnu_alarm/common/secrets.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/common/widgets/common_ad_web_view_screen.dart';
import 'package:jnu_alarm/common/widgets/notice_web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/trend/view_models/trend_view_model.dart';

class TrendScreen extends ConsumerStatefulWidget {
  const TrendScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrendScreenState();
}

class _TrendScreenState extends ConsumerState<TrendScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late AnimationController _adAnimationController;
  late Animation<double> _adAnimation;
  final ScrollController _scrollController = ScrollController();

  // AdMob Start
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  final String _debugAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-3940256099942544/3986624511';
  final String _releaseAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4183402691727093/9886095896'
      : 'ca-app-pub-4183402691727093/7281820149';
  String get _adUnitId => kDebugMode ? _debugAdUnitId : _releaseAdUnitId;

  /// Loads a native ad.
  void loadAd() {
    _nativeAd = NativeAd(
      adUnitId: _adUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
          _adAnimationController.forward();
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: Colors.transparent,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
          textColor: const Color(0xFF282828),
          backgroundColor: Colors.transparent,
          size: 16.0,
          style: NativeTemplateFontStyle.bold,
        ),
        primaryTextStyle: NativeTemplateTextStyle(
            style: NativeTemplateFontStyle.normal, size: 16.0),
      ),
    )..load();
  }
  // AdMob End

  @override
  void initState() {
    super.initState();
    loadAd();
    _adAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _adAnimation =
        CurvedAnimation(parent: _adAnimationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    _adAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTapWeb(String title, String link, String body) {
    if (link.isEmpty) return;
    Navigator.pushNamed(
      context,
      CommonAdWebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: title,
        link: link,
        body: body,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final trendState = ref.watch(trendProvider);
    final isDark = isDarkMode(context);
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "트렌드",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        child: const SafeArea(
          child: Column(
            children: [
              Gaps.v36,
              Gaps.v16,
              Gaps.v16,
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
