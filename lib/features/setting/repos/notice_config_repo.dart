import 'package:shared_preferences/shared_preferences.dart';

class NoticeSettingRepository {
  final SharedPreferences _preferences;

  NoticeSettingRepository(this._preferences);

  bool isSubscribed(String topic) {
    return _preferences.getBool(topic) ?? false;
  }

  Future<void> setTopic(String topic, bool isSubscribed) async {
    _preferences.setBool(topic, isSubscribed);
  }

  Future<void> setSubscribedTopics(String topic, bool isSubscribed) async {
    final subscribedTopics = (await getSubscribedTopics()).toSet();
    isSubscribed ? subscribedTopics.add(topic) : subscribedTopics.remove(topic);
    _preferences.setStringList("subscribed_topics", subscribedTopics.toList());
  }

  Future<List<String>> getSubscribedTopics() async {
    return _preferences.getStringList("subscribed_topics") ?? [];
  }
}
