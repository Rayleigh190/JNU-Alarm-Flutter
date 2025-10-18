import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_item_model.dart';
import 'package:jnu_alarm/features/trend/view_models/trend_view_model.dart';
import 'package:jnu_alarm/features/trend/views/widgets/popular_notice_box.dart';
import 'package:jnu_alarm/features/trend/views/widgets/trend_ad.dart';

class TrendScreen extends ConsumerStatefulWidget {
  const TrendScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrendScreenState();
}

class _TrendScreenState extends ConsumerState<TrendScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
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
                const TrendAd(),
                Gaps.v16,
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
                        trend: dailyPopularNotices[index].trend,
                      ),
                    );
                    return PopularNoticesBox(
                        title: " 지난 24시간 인기 공지", items: items);
                  },
                  loading: () {
                    return const PopularNoticesBox(
                      title: " 지난 24시간 인기 공지",
                      items: [],
                      isLoading: true,
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    debugPrint(error.toString());
                    return Container();
                  },
                ),
                Gaps.v20,
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
                    return PopularNoticesBox(
                        title: " 지난 7일 인기 공지", items: items);
                  },
                  loading: () {
                    return const PopularNoticesBox(
                      title: " 지난 7일 인기 공지",
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
