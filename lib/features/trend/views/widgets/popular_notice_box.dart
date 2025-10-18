import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/common/widgets/notice_web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/view_models/notice_view_model.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_item_model.dart';
import 'package:jnu_alarm/features/trend/views/widgets/popular_notice_item.dart';

class PopularNoticesBox extends ConsumerStatefulWidget {
  final String title;
  final List<PopularNoticeItemModel> items;
  final bool? isLoading;

  const PopularNoticesBox({
    super.key,
    required this.title,
    required this.items,
    this.isLoading,
  });

  @override
  ConsumerState<PopularNoticesBox> createState() => _PopularNoticesBoxState();
}

class _PopularNoticesBoxState extends ConsumerState<PopularNoticesBox> {
  void _onTapNotice(NoticeModel notice) {
    if (notice.link.isEmpty) return;
    ref.watch(noticeProvider.notifier).hitNotice(notice.id);
    Navigator.pushNamed(
      context,
      NoticeWebViewScreen.routeName,
      arguments: WebViewScreenArgs(
        title: notice.title,
        link: notice.link,
        body: notice.body,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    final isLoading = widget.isLoading ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Gaps.v5,
        Stack(
          children: [
            PopularNoticeContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () =>
                        items.isNotEmpty ? _onTapNotice(items[0].notice) : null,
                    child: PopularNoticeItem(
                      rank: "1",
                      body: items.isNotEmpty ? items[0].notice.body : "-",
                      hits: items.isNotEmpty ? items[0].hits : 0,
                      trend: items.isNotEmpty ? items[0].trend : null,
                    ),
                  ),
                  Gaps.v14,
                  GestureDetector(
                    onTap: () =>
                        items.length > 1 ? _onTapNotice(items[1].notice) : null,
                    child: PopularNoticeItem(
                      rank: "2",
                      body: items.length > 1 ? items[1].notice.body : "-",
                      hits: items.length > 1 ? items[1].hits : 0,
                      trend: items.length > 1 ? items[1].trend : null,
                    ),
                  ),
                  Gaps.v14,
                  GestureDetector(
                    onTap: () =>
                        items.length > 2 ? _onTapNotice(items[2].notice) : null,
                    child: PopularNoticeItem(
                      rank: "3",
                      body: items.length > 2 ? items[2].notice.body : "-",
                      hits: items.length > 2 ? items[2].hits : 0,
                      trend: items.length > 2 ? items[2].trend : null,
                    ),
                  ),
                  Gaps.v14,
                  GestureDetector(
                    onTap: () =>
                        items.length > 3 ? _onTapNotice(items[3].notice) : null,
                    child: PopularNoticeItem(
                      rank: "4",
                      body: items.length > 3 ? items[3].notice.body : "-",
                      hits: items.length > 3 ? items[3].hits : 0,
                      trend: items.length > 3 ? items[3].trend : null,
                    ),
                  ),
                  Gaps.v14,
                  GestureDetector(
                    onTap: () =>
                        items.length > 4 ? _onTapNotice(items[4].notice) : null,
                    child: PopularNoticeItem(
                      rank: "5",
                      body: items.length > 4 ? items[4].notice.body : "-",
                      hits: items.length > 4 ? items[4].hits : 0,
                      trend: items.length > 4 ? items[4].trend : null,
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              const PopularNoticeContainer(
                child: Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            if (!isLoading && items.isEmpty)
              const PopularNoticeContainer(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🧐",
                        style: TextStyle(fontSize: 35),
                      ),
                      Text("아직 데이터를 분석 중이에요!"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class PopularNoticeContainer extends StatelessWidget {
  const PopularNoticeContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Container(
      width: double.infinity,
      height: 176.0,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color.fromARGB(255, 53, 53, 53) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
