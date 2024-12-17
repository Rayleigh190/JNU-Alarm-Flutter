import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';
import 'package:jnu_alarm/features/notice/views/widgets/notice_divider.dart';
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
    ref.watch(noticeProvider.notifier).setReadStatus(id);
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => WebViewScreen(title: title, link: link, body: body),
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = isDarkMode(context);
    final double appBarHeight =
        kToolbarHeight + MediaQuery.of(context).padding.top;
    final notices = ref.watch(noticeProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "알림 내역",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await DatabaseHelper.deleteDatabase();
            },
            child: const Text("delete"),
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            edgeOffset: appBarHeight,
            color: Theme.of(context).primaryColor,
            backgroundColor: const Color(0xFF323430),
            onRefresh: _onRefresh,
            child: notices.when(
              data: (items) {
                if (items.isEmpty) {
                  return Stack(
                    children: [
                      const Center(
                        child: Text("설정에서 알림을 구독하세요!"),
                      ),
                      ListView(),
                    ],
                  );
                }
                return ListView.separated(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(
                    Sizes.size20,
                    appBarHeight + Sizes.size5,
                    Sizes.size20,
                    Sizes.size96 + Sizes.size20,
                  ),
                  itemBuilder: (context, index) {
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
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
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
