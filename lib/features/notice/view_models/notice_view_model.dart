import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeViewModel extends AsyncNotifier<List<NoticeModel>> {
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

  Future<List<NoticeModel>> _fetchNotices() async {
    await _checkNewNoticeAndSave();
    // 무한 스크롤에 맞게 수정해야 됨
    final response = await DatabaseHelper.fetchNotices(0, 15);
    return response;
  }

  @override
  Future<List<NoticeModel>> build() async {
    return _fetchNotices();
  }

  Future<void> refresh() async {
    state = AsyncValue.data(await _fetchNotices());
  }

  Future<void> setAsRead(int id) async {
    await DatabaseHelper.updateNoticeReadStatus(id, 1);
    state = state.whenData((notices) {
      return notices.map((notice) {
        if (notice.id == id) {
          return notice.copyWith(is_read: 1);
        }
        return notice;
      }).toList();
    });
  }
}

final noticeProvider =
    AsyncNotifierProvider<NoticeViewModel, List<NoticeModel>>(
        () => throw UnimplementedError());
