import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jnu_alarm/features/setting/models/notice_setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeSettingViewModel extends StateNotifier<NoticeSettingModel> {
  NoticeSettingViewModel() : super(const NoticeSettingModel(topics: {})) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final topicKeys = _topicMap.keys; // 전체 토픽
    final savedTopics = Map.fromEntries(
      topicKeys.map((topic) => MapEntry(topic, prefs.getBool(topic) ?? false)),
    );

    state = NoticeSettingModel(topics: savedTopics);
  }

  // Future<void> _loadSettings() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final topicKeys = _topicMap.keys; // 전체 토픽
  //   final savedTopics = topicKeys.map((topic) {
  //     return MapEntry(topic, prefs.getBool(topic) ?? false);
  //   }).toMap();
  //   state = NoticeSettingModel(topics: savedTopics);
  // }

  Future<void> toggleTopic(String topic, bool isSubscribed) async {
    final prefs = await SharedPreferences.getInstance();
    if (isSubscribed) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
    await prefs.setBool(topic, isSubscribed);
    state = NoticeSettingModel(
      topics: {...state.topics, topic: isSubscribed},
    );
  }

  static const Map<String, String> _topicMap = {
    "test": "테스트 알림",
  };

  static Map<String, List<Map<String, String>>> groupedTopics = {
    "개발자 모드": [
      {"test": "테스트 알림"},
    ],
  };
}

final noticeSettingProvider =
    StateNotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  (ref) => NoticeSettingViewModel(),
);
