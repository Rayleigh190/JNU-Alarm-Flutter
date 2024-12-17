import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeViewModel extends AsyncNotifier<List<dynamic>> {
  final NoticeSettingRepository _repository;

  NoticeViewModel(this._repository);

  Future<List<NoticeModel>> _fetchNewNotices() async {
    final topics = await _repository.getSubscribedTopics();
    final prefs = await SharedPreferences.getInstance();
    final lastNoticeFetchDate =
        DateTime.parse(prefs.getString("last_notice_fetch_date")!);
    final response =
        await NoticeRepository.fetchNotices(topics, lastNoticeFetchDate);
    prefs.setString("last_notice_fetch_date", DateTime.now().toString());
    return response.response;
  }

  Future<void> _checkNewNoticeAndSave() async {
    final newNotices = await _fetchNewNotices();
    if (newNotices.isEmpty) return;
    for (NoticeModel notice in newNotices.reversed) {
      DatabaseHelper.insertNotice(notice);
    }
  }

  Future<List<dynamic>> _fetchNotices() async {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));

    await _checkNewNoticeAndSave();

    // 무한 스크롤에 맞게 수정해야 됨
    final response = await DatabaseHelper.fetchNotices(0, 15);

    List<NoticeModel> todayNotices = [];
    List<NoticeModel> yesterdayNotices = [];
    List<NoticeModel> previousNotices = [];
    for (var data in response) {
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
  Future<List<dynamic>> build() async {
    return _fetchNotices();
  }

  Future<void> refresh() async {
    state = AsyncValue.data(await _fetchNotices());
  }
}

final noticeProvider = AsyncNotifierProvider<NoticeViewModel, List<dynamic>>(
    () => throw UnimplementedError());
