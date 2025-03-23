import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jnu_alarm/common/network/network_connection_check.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/models/notice_setting_model.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';

class NoticeSettingViewModel extends Notifier<NoticeSettingModel> {
  final NoticeSettingRepository _repository;
  final List<SettingSection> _settingSectionGroup;

  NoticeSettingViewModel(this._repository, this._settingSectionGroup);

  Future<void> toggleTopic(String topic, bool isSubscribed) async {
    await checkNetworkConnection();
    if (isSubscribed) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
    await _repository.setTopic(topic, isSubscribed);
    await _repository.setSubscribedTopics(topic, isSubscribed);
    state = NoticeSettingModel(
      topics: {...state.topics, topic: isSubscribed},
    );
  }

  Future<List<String>> getSubscribedTopics() async {
    return await _repository.getSubscribedTopics();
  }

  @override
  NoticeSettingModel build() {
    final savedTopics = {
      for (var tile in _settingSectionGroup.expand((section) => section.tiles))
        if (tile is SwitchTile)
          tile.topic: _repository.isSubscribed(tile.topic),
    };
    return NoticeSettingModel(topics: savedTopics);
  }
}

final mainNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final homeNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final collegeNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final departNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final sgSchoolNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final spSchoolNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);

final businessNoticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);
