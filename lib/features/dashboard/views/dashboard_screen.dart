import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:jnu_alarm/common/enums/campus_type.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:jnu_alarm/features/dashboard/views/map_screen.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/dashboard_main_button.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _adAnimationController;
  late Animation<double> _adAnimation;

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
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _adAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _adAnimation =
        CurvedAnimation(parent: _adAnimationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    _animationController.dispose();
    _adAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(dashboardProvider.notifier).refresh();
    });
  }

  void _onTapWeb(String title, String link, String body) {
    if (link.isEmpty) return;
    Navigator.pushNamed(
      context,
      WebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: title,
        link: link,
        body: body,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardProvider);
    final isDark = isDarkMode(context);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('M월 d일 (E)', 'ko_KR').format(now);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Gaps.v24,
              Center(
                child: Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ),
              Gaps.v16,
              dashboardState.when(
                data: (data) {
                  _animationController.forward(); // 데이터 로딩 후 애니메이션 실행
                  return FadeTransition(
                    opacity: _animation,
                    child: GestureDetector(
                      onTap: () => _onTapWeb(
                          "캠퍼스 날씨", data.weather.naverUrl, "캠퍼스 날씨를 확인해 보세요!"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.network(
                            width: 60,
                            data.weather.imageUrl,
                            placeholderBuilder: (context) => const SizedBox(
                              width: 60,
                              height: 60,
                            ),
                          ),
                          Gaps.h6,
                          Text(
                            "${data.weather.temperature}°C",
                            style: const TextStyle(
                              fontSize: Sizes.size24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () {
                  _animationController.reset();
                  return const SizedBox(
                    height: 60,
                  );
                },
                error: (err, stack) => SizedBox(
                  height: 60,
                  child: Center(child: Text('Error: $err')),
                ),
              ),
              Gaps.v5,
              Container(
                padding: const EdgeInsets.fromLTRB(5, 4, 11, 3),
                decoration: const BoxDecoration(
                  color: Color(0xFF323430),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Sizes.size56,
                    ),
                  ),
                ),
                child: PopupMenuButton(
                  onSelected: (value) {
                    ref
                        .watch(dashboardProvider.notifier)
                        .setWeatherCampus(value);
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: CampusType.yongbong,
                        child: Text('광주캠'),
                      ),
                      const PopupMenuItem(
                        value: CampusType.yeosu,
                        child: Text('여수캠'),
                      ),
                      const PopupMenuItem(
                        value: CampusType.hwasun,
                        child: Text('화순캠'),
                      ),
                    ];
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        color: Colors.white70,
                        size: Sizes.size16,
                      ),
                      Gaps.h1,
                      dashboardState.when(
                        data: (data) {
                          return FadeTransition(
                            opacity: _animation,
                            child: Text(
                              data.weather.campusName,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        loading: () => const Text(
                          "ㅇㅇ캠",
                          style: TextStyle(
                            color: Color(0xFF323430),
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        error: (Object error, StackTrace stackTrace) =>
                            Text('Error: $error'),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v36,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _onTapWeb(
                        "학사일정",
                        "https://www.jnu.ac.kr/WebApp/web/HOM/TOP/Schedule300.aspx",
                        "학사일정을 확인해 보세요!",
                      ),
                      child: const DashboardMainButton(
                        title: "학사일정",
                        emoji: '🗓️',
                      ),
                    ),
                  ),
                  Gaps.h16,
                  Flexible(
                    child: GestureDetector(
                      onTap: () => _onTapWeb(
                        "학식메뉴",
                        "https://today.jnu.ac.kr/Program/MealPlan.aspx",
                        "학식메뉴를 확인해 보세요!",
                      ),
                      child: const DashboardMainButton(
                        title: "학식메뉴",
                        emoji: '🍱',
                      ),
                    ),
                  ),
                  Gaps.h16,
                  Flexible(
                    child: PopupMenuButton(
                      onSelected: (value) {
                        _onTapWeb(
                          "긱식메뉴",
                          value,
                          "긱식메뉴를 확인해 보세요!",
                        );
                      },
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value:
                                "https://dormitory.jnu.ac.kr/Board/Board.aspx?BoardID=2",
                            child: Text("용봉캠"),
                          ),
                          const PopupMenuItem(
                            value:
                                "https://house.jnu.ac.kr/Board/Board.aspx?BoardID=36",
                            child: Text("여수캠"),
                          ),
                          const PopupMenuItem(
                            value:
                                "https://hsdorm.jnu.ac.kr/Board/Board.aspx?BoardID=70",
                            child: Text("화순캠"),
                          ),
                        ];
                      },
                      child: const DashboardMainButton(
                        title: "긱식메뉴",
                        emoji: '🍽️',
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(MapScreen.routeName),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF282828) : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Sizes.size12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 1.0,
                        spreadRadius: 1,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🗺️",
                        style: TextStyle(
                          fontSize: Sizes.size40,
                        ),
                      ),
                      Text(
                        "전대지도",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v16,
              if (_nativeAdIsLoaded && _nativeAd != null)
                FadeTransition(
                  opacity: _adAnimation,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF282828) : Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Sizes.size12),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 1.0,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 320, // minimum recommended width
                        minHeight: 320, // minimum recommended height
                        maxWidth: 614,
                        maxHeight: 614,
                      ),
                      child: SizedBox(
                        width:
                            MediaQuery.of(context).size.width - (16 + 15) * 2,
                        height:
                            MediaQuery.of(context).size.width - (16 + 15) * 2,
                        child: AdWidget(ad: _nativeAd!),
                      ),
                    ),
                    // AdMob End,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
