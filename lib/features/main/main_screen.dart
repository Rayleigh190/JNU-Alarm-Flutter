import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/main/widgets/bottom_nav_btn.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';
import 'package:jnu_alarm/features/notice/views/notice_screen.dart';
import 'package:jnu_alarm/common/fcm/repos/fcm_ropo.dart';
import 'package:jnu_alarm/features/setting/views/main_setting_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const routeName = "/main";
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Widget> _page = [
    const NoticeScreen(),
    const MainSettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    final FcmRepository fcmRepository = FcmRepository();

    if (Platform.isAndroid) {
      fcmRepository.handleAndroidForegroundMessage((title, link, body, id) {
        pushWebViewScreen(title, link, body, id);
      });
    }

    fcmRepository.handleOnMessageOpenedFromBackground((title, link, body, id) {
      pushWebViewScreen(title, link, body, id);
    });

    fcmRepository.handleOnMessageOpendFromTerminated((title, link, body, id) {
      pushWebViewScreen(title, link, body, id);
    });

    _tabController = TabController(
      length: _page.length,
      vsync: this,
      animationDuration: const Duration(milliseconds: 200),
    );
    _tabController.addListener(tabListener);
  }

  Future<void> pushWebViewScreen(
      String title, String link, String body, int id) async {
    final noticeProvider_ = ref.read(noticeProvider.notifier);
    // 1. 새로운 알림내역 가져와서 db에 저장
    await noticeProvider_.checkNewNoticeAndSave();
    // 2. 읽음처리
    await noticeProvider_.setAsRead(id);

    if (link.isEmpty) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => WebViewScreen(
            title: title,
            link: link,
            body: body,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: _page,
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF323430),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, Sizes.size2),
                    blurRadius: Sizes.size3,
                    spreadRadius: Sizes.size3,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size12,
                  horizontal: Sizes.size12,
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      left: bottomNavBtnAnimatedPositionedLeftValue(
                          _currentIndex),
                      child: Container(
                        width: Sizes.size36,
                        height: Sizes.size36,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BottomNavBtn(
                            icon: Icons.alarm,
                            currentIndex: _currentIndex,
                            index: 0,
                            onTap: (index) => _onTap(index),
                          ),
                          Gaps.h10,
                          BottomNavBtn(
                            icon: Icons.settings,
                            currentIndex: _currentIndex,
                            index: 1,
                            onTap: (index) => _onTap(index),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double bottomNavBtnAnimatedPositionedLeftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return 0;
    case 1:
      return 46;
    case 2:
      return 92;
    default:
      return 0;
  }
}
