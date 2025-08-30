import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/common/widgets/notice_web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_divider.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_header.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_tile.dart';

class NoticeScreen extends ConsumerStatefulWidget {
  const NoticeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends ConsumerState<NoticeScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollUpBtn = false;

  void _tapScrollUpBtn() {
    if (_showScrollUpBtn) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }
  }

  void _onTapNoticeTile(String title, String link, String body, int id) {
    if (link.isEmpty) return;
    ref.watch(noticeProvider.notifier).setAsRead(id);
    Navigator.pushNamed(
      context,
      NoticeWebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: title,
        link: link,
        body: body,
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showScrollUpBtn) return;
      setState(() {
        _showScrollUpBtn = true;
      });
    } else {
      setState(() {
        _showScrollUpBtn = false;
      });
    }
  }

  Future<void> _onRefresh() {
    return ref.watch(noticeProvider.notifier).refresh();
  }

  Future<void> initAppTracking() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;

    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    debugPrint('IDFA: $uuid');
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      initAppTracking();
    }
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.watch(noticeProvider.notifier).refresh();
    }
  }

  List<dynamic> _convertToListViewItems(List<dynamic> notices) {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));
    List<NoticeModel> todayNotices = [];
    List<NoticeModel> yesterdayNotices = [];
    List<NoticeModel> previousNotices = [];

    for (var data in notices) {
      if (data.created_at.isAfter(todayStart)) {
        todayNotices.add(data);
      } else if (data.created_at.isAfter(yesterdayStart)) {
        yesterdayNotices.add(data);
      } else {
        previousNotices.add(data);
      }
    }

    List<dynamic> items = [
      if (todayNotices.isNotEmpty) ...[
        '오늘',
        ...todayNotices,
        Gaps.v5,
      ],
      if (yesterdayNotices.isNotEmpty) ...[
        '어제',
        ...yesterdayNotices,
        Gaps.v5,
      ],
      if (previousNotices.isNotEmpty) ...[
        '이전',
        ...previousNotices,
      ],
    ];
    return items;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = isDarkMode(context);
    final double appBarHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    final notices = ref.watch(noticeProvider);
    final noticesNotifier = ref.read(noticeProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "알림 내역",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            edgeOffset: appBarHeight,
            color: Theme.of(context).primaryColor,
            backgroundColor: const Color(0xFF323430),
            onRefresh: _onRefresh,
            child: CupertinoScrollbar(
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
                    child: NoticeHeader(),
                  ),
                  notices.when(
                    data: (data) {
                      final items = _convertToListViewItems(data);
                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Sizes.size20,
                          Sizes.size10,
                          Sizes.size20,
                          0,
                        ),
                        shrinkWrap: true, // 높이를 내용물만큼 줄이기
                        // 스크롤 막기 (바깥 ListView가 담당)
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index >= items.length) {
                            noticesNotifier.fetchMoreNotices();
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: Sizes.size10),
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            );
                          }
                          final item = items[index];
                          if (item is String) {
                            return NoticeDivider(
                              text: item,
                            );
                          } else if (item is NoticeModel) {
                            return GestureDetector(
                              onTap: () => _onTapNoticeTile(
                                  item.title, item.link, item.body, item.id),
                              child: NoticeTile(
                                title: item.title,
                                body: item.body,
                                link: item.link,
                                createdAt: item.created_at,
                                isRead: item.is_read == 1,
                              ),
                            );
                          }
                          return item;
                        },
                        separatorBuilder: (context, index) =>
                            (items[index] is String) ? Gaps.v6 : Gaps.v5,
                        itemCount: items.length,
                      );
                    },
                    error: (error, stackTrace) => SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: Text(error.toString()),
                      ),
                    ),
                    loading: () => SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: Sizes.size10,
            bottom: Sizes.size64,
            child: AnimatedOpacity(
              opacity: _showScrollUpBtn ? 1 : 0,
              duration: const Duration(milliseconds: 150),
              child: GestureDetector(
                onTap: _tapScrollUpBtn,
                child: Container(
                  width: Sizes.size36,
                  height: Sizes.size36,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF323430) : Colors.white,
                    border: Border.all(
                      width: 0.5,
                      color: isDark ? Colors.white10 : Colors.black26,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_up,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
