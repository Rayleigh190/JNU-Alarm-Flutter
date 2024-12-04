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
}
