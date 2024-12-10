import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/fcm/widgets/foreground_notification.dart';
import 'package:jnu_alarm/common/fcm/widgets/web_view_page.dart';
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

    fcmRepository.handleForegroundMessage((title, body) {
      showForegroundNotification(context, title, body);
    });

    fcmRepository.handleOnMessageOpenedFromBackground((title, link) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => WebViewPage(title: title, link: link),
        ),
      );
    });

    fcmRepository.handleOnMessageOpendFromTerminated((title, link) {
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (_) => WebViewPage(title: title, link: link),
        ),
      );
    });

    _tabController = TabController(
      length: _page.length,
      vsync: this,
      animationDuration: const Duration(milliseconds: 200),
    );
    _tabController.addListener(tabListener);
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

  void showForegroundNotification(
      BuildContext context, String title, String body) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 60,
        left: 14,
        right: 14,
        child: ForegroundNotification(
          title: title,
          body: body,
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 4)).then((_) {
      overlayEntry.remove();
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
