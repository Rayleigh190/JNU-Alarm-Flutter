import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeViewModel extends AsyncNotifier<List<dynamic>> {
  final NoticeSettingRepository _repository;

  NoticeViewModel(this._repository);

  int _offset = 0;
  final int _limit = 15;
  bool _hasMore = true;

  bool get hasMore => _hasMore;

  Future<void> fetchMoreNotices() async {
    if (!_hasMore) return;
    final newNotices = await DatabaseHelper.fetchNotices(_offset, _limit);
    if (newNotices.length < _limit) {
      _hasMore = false;
    }
    state = AsyncValue.data([...state.value ?? [], ...newNotices]);
    _offset += _limit;
  }

  Future<List<NoticeModel>> _fetchNewNotices() async {
    final topics = await _repository.getSubscribedTopics();
    final prefs = await SharedPreferences.getInstance();
    final lastNoticeFetchDate =
        DateTime.parse(prefs.getString("last_notice_fetch_date")!);
    final response =
        await NoticeRepository.fetchNotices(topics, lastNoticeFetchDate);
    prefs.setString("last_notice_fetch_date", DateTime.now().toString());
    return response?.response ?? [];
  }

  Future<void> checkNewNoticeAndSave() async {
    final newNotices = await _fetchNewNotices();
    if (newNotices.isEmpty) return;
    for (NoticeModel notice in newNotices.reversed) {
      DatabaseHelper.insertNotice(notice);
    }
  }

  Future<List<dynamic>> _fetchNotices() async {
    await checkNewNoticeAndSave();
    _hasMore = true;
    _offset = 0;
    final response = await DatabaseHelper.fetchNotices(_offset, _limit);
    if (response.length < _limit) _hasMore = false;
    _offset += _limit;

    final topBannerRes = await NoticeRepository.fetchTopBanner();
    return [...topBannerRes?.response ?? [], ...response];
  }

  @override
  Future<List<dynamic>> build() async {
    return _fetchNotices();
  }

  Future<void> refresh() async {
    state = AsyncValue.data(await _fetchNotices());
  }

  Future<void> setAsRead(int id) async {
    await DatabaseHelper.updateNoticeReadStatus(id, 1);
    state = state.whenData((notices) {
      return notices.map((notice) {
        if (notice is NoticeModel && notice.id == id) {
          return notice.copyWith(is_read: 1);
        }
        return notice;
      }).toList();
    });
  }
}

final noticeProvider = AsyncNotifierProvider<NoticeViewModel, List<dynamic>>(
    () => throw UnimplementedError());
