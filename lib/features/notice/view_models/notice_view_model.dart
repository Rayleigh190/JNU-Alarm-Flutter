import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';

class NoticeViewModel extends AsyncNotifier<List<dynamic>> {
  final NoticeSettingRepository _repository;

  NoticeViewModel(this._repository);

  @override
  Future<List<dynamic>> build() async {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    final topics = await _repository.getSubscribedTopics();

    final response = await NoticeRepository.fetchNotices(topics);

    List<NoticeModel> todayNotices = [];
    List<NoticeModel> yesterdayNotices = [];
    List<NoticeModel> previousNotices = [];
    for (var data in response.response) {
      if (data.created_at.isAfter(todayStart)) {
        todayNotices.add(data);
      } else if (data.created_at.isAfter(yesterdayStart)) {
        yesterdayNotices.add(data);
      } else {
        previousNotices.add(data);
      }
    }

    List<dynamic> items = [
      Gaps.v5,
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

  // Future<void> fetchNotices() async {
  //   state = const AsyncValue.loading();
  //   final response = await NoticeRepository.fetchNotices();
  //   state = AsyncValue.data(response.response);
  // }
}

final noticeProvider = AsyncNotifierProvider<NoticeViewModel, List<dynamic>>(
    () => throw UnimplementedError());
