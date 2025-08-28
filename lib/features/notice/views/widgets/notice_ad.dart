import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class NoticeAd extends StatefulWidget {
  const NoticeAd({super.key});

  @override
  State<NoticeAd> createState() => _NoticeAdState();
}

class _NoticeAdState extends State<NoticeAd> {
  // AdMob Start
  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  final String _debugAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-3940256099942544/3986624511';
  final String _releaseAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-4183402691727093/9784516940'
      : 'ca-app-pub-4183402691727093/3174914557';
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
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      factoryId: "NoticeNativeAd",
    )..load();
  }
  // AdMob End

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode(context) ? const Color(0xFF282828) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.size9),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(5, 0, 0, 0),
            blurRadius: Sizes.size5,
            spreadRadius: Sizes.size1,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: SizedBox(
          height:
              (MediaQuery.of(context).size.width - ((5 + 20) * 2)) * (1 / 4),
          child: _nativeAdIsLoaded && _nativeAd != null
              ? AdWidget(ad: _nativeAd!)
              : Container(),
        ),
      ),
    );
  }
}
