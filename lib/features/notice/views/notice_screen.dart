import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

class _NoticeScreenState extends ConsumerState<NoticeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollUpBtn = false;

  void _tapScrollUpBtn() {
    if (_showScrollUpBtn) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate);
    }
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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: notices.when(
        data: (items) {
          return ListView.separated(
            controller: _scrollController,
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
                return NoticeTile(
                  title: item.title,
                  body: item.body,
                  link: item.link,
                  createdAt: item.created_at,
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
    );
  }
}
