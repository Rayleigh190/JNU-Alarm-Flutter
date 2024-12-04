import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jnu_alarm/features/setting/models/notice_setting_model.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';

class NoticeSettingViewModel extends Notifier<NoticeSettingModel> {
  final NoticeSettingRepository _repository;

  NoticeSettingViewModel(this._repository);

  static const Map<String, String> _topicMap = {
    "test": "테스트 알림",
    "test2": "테스트2 알림",
  };

  static Map<String, List<Map<String, String>>> groupedTopics = {
    "개발자 모드": [
      {"test": "테스트 알림"},
      {"test2": "테스트2 알림"},
    ],
  };

  Future<void> toggleTopic(String topic, bool isSubscribed) async {
    if (isSubscribed) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
    await _repository.setTopic(topic, isSubscribed);
    state = NoticeSettingModel(
      topics: {...state.topics, topic: isSubscribed},
    );
  }

  @override
  NoticeSettingModel build() {
    final topicKeys = _topicMap.keys;
    final savedTopics = Map.fromEntries(
      topicKeys
          .map((topic) => MapEntry(topic, _repository.isSubscribed(topic))),
    );
    return NoticeSettingModel(topics: savedTopics);
  }
}

final noticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);
