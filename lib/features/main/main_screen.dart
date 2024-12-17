import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/main/widgets/bottom_nav_btn.dart';
import 'package:jnu_alarm/features/notice/views/notice_screen.dart';
import 'package:jnu_alarm/common/fcm/repos/fcm_ropo.dart';
import 'package:jnu_alarm/features/setting/views/main_setting_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "/main";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
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
      fcmRepository.handleAndroidForegroundMessage((title, link, body) {
        pushWebViewScreen(title, link, body);
      });
    }

    fcmRepository.handleOnMessageOpenedFromBackground((title, link, body) {
      pushWebViewScreen(title, link, body);
    });

    fcmRepository.handleOnMessageOpendFromTerminated((title, link, body) {
      pushWebViewScreen(title, link, body);
    });

    _tabController = TabController(
      length: _page.length,
      vsync: this,
      animationDuration: const Duration(milliseconds: 200),
    );
    _tabController.addListener(tabListener);
  }

  void pushWebViewScreen(String title, String link, String body) {
    if (link.isEmpty) return;
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => WebViewScreen(
          title: title,
          link: link,
          body: body,
        ),
      ),
    );
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
