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
    ref.watch(noticeProvider.notifier).hitNotice(id);
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
    final noticesNotifier = ref.watch(noticeProvider.notifier);
    if (noticesNotifier.isEditMode) noticesNotifier.changeEditMode();
    return noticesNotifier.refresh();
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

  void _showAlertDialog(BuildContext context, void Function() action) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('🚨주의'),
        content: const Text('알림을 삭제하면 복구가 불가능합니다.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.lightBlue),
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              action();
              Navigator.pop(context);
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = isDarkMode(context);
    final double appBarHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    final notices = ref.watch(noticeProvider);
    final noticesNotifier = ref.read(noticeProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "알림 내역",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            noticesNotifier.isEditMode
                ? TextButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                          Colors.transparent), // 눌림 효과 제거
                    ),
                    child: const Text("완료",
                        style: TextStyle(color: Colors.lightBlue)),
                    onPressed: () {
                      noticesNotifier.changeEditMode();
                    },
                  )
                : IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      noticesNotifier.changeEditMode();
                    },
                  )
          ],
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
                child: CustomScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    // 헤더
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          Sizes.size20,
                          appBarHeight + Sizes.size5,
                          Sizes.size20,
                          Sizes.size5,
                        ),
                        child: const NoticeHeader(),
                      ),
                    ),

                    // 데이터 처리
                    notices.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return const SliverFillRemaining(
                            hasScrollBody: false,
                            child: Align(
                              alignment: Alignment(0, -0.25),
                              child: Text(
                                "설정에서 알림을 구독하세요!\n\n새로운 알림이 오면 이곳에 저장됩니다.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }

                        return SliverList.separated(
                          itemBuilder: (context, index) {
                            if (index == data.length) {
                              noticesNotifier.fetchMoreNotices();
                              return noticesNotifier.hasMore
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.only(top: Sizes.size10),
                                      child: Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    )
                                  : const SizedBox(height: 100);
                            }

                            final item = data[index];
                            if (item is String) {
                              return NoticeDivider(text: item);
                            } else if (item is NoticeModel) {
                              if (noticesNotifier.isEditMode) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size20),
                                  child: NoticeTile(
                                    id: item.id,
                                    title: item.title,
                                    body: item.body,
                                    link: item.link,
                                    createdAt: item.created_at,
                                    isRead: item.is_read == 1,
                                    isBookmarked: item.is_bookmarked == 1,
                                    isEditMode: true,
                                    onDeleteTap: () {
                                      _showAlertDialog(context, () {
                                        noticesNotifier.deleteNotice(
                                            index, item.id);
                                      });
                                    },
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () => _onTapNoticeTile(
                                  item.title,
                                  item.link,
                                  item.body,
                                  item.id,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size20),
                                  child: NoticeTile(
                                    id: item.id,
                                    title: item.title,
                                    body: item.body,
                                    link: item.link,
                                    createdAt: item.created_at,
                                    isRead: item.is_read == 1,
                                    isBookmarked: item.is_bookmarked == 1,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          separatorBuilder: (context, index) => Gaps.v5,
                          itemCount: data.length + 1,
                        );
                      },
                      error: (error, stackTrace) => SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(error.toString()),
                        ),
                      ),
                      loading: () => const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Align(
                          alignment: Alignment(0, -0.25),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 스크롤 업 버튼
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
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
