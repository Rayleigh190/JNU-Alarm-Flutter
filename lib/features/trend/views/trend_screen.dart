import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jnu_alarm/common/widgets/common_ad_web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_item_model.dart';
import 'package:jnu_alarm/features/trend/view_models/trend_view_model.dart';
import 'package:jnu_alarm/features/trend/views/widgets/popular_notice_box.dart';

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

  Future<void> _onRefresh() async {
    await ref.watch(trendProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final trendState = ref.watch(trendProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "트렌드",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        backgroundColor: const Color(0xFF323430),
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
          ),
          child: SafeArea(
            child: Column(
              children: [
                trendState.when(
                  data: (data) {
                    final dailyPopularNotices =
                        data.popularNoticeList.daily_top;
                    final items = List.generate(
                      dailyPopularNotices.length,
                      (index) => PopularNoticeItemModel(
                          notice: NoticeModel(
                            id: dailyPopularNotices[index].id,
                            title: dailyPopularNotices[index].title,
                            body: dailyPopularNotices[index].body,
                            link: dailyPopularNotices[index].link,
                            created_at: DateTime.now(),
                          ),
                          hits: dailyPopularNotices[index].daily_hits ?? 0),
                    );
                    return PopularNoticesBox(title: "일간 인기 공지", items: items);
                  },
                  loading: () {
                    return const PopularNoticesBox(
                      title: "일간 인기 공지",
                      items: [],
                      isLoading: true,
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    debugPrint(error.toString());
                    return Container();
                  },
                ),
                Gaps.v16,
                trendState.when(
                  data: (data) {
                    final weeklyPopularNotices =
                        data.popularNoticeList.weekly_top;
                    final items = List.generate(
                      weeklyPopularNotices.length,
                      (index) => PopularNoticeItemModel(
                          notice: NoticeModel(
                            id: weeklyPopularNotices[index].id,
                            title: weeklyPopularNotices[index].title,
                            body: weeklyPopularNotices[index].body,
                            link: weeklyPopularNotices[index].link,
                            created_at: DateTime.now(),
                          ),
                          hits: weeklyPopularNotices[index].weekly_hits ?? 0),
                    );
                    return PopularNoticesBox(title: "주간 인기 공지", items: items);
                  },
                  loading: () {
                    return const PopularNoticesBox(
                      title: "주간 인기 공지",
                      items: [],
                      isLoading: true,
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    debugPrint(error.toString());
                    return Container();
                  },
                ),
                Gaps.v96
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
