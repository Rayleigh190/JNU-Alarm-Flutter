import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jnu_alarm/common/network/network_connection_check.dart';
import 'package:jnu_alarm/features/setting/constants/main_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/models/notice_setting_model.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:jnu_alarm/common/error/global_error_handler.dart';

class NoticeSettingViewModel extends Notifier<NoticeSettingModel> {
  final NoticeSettingRepository _repository;

  NoticeSettingViewModel(this._repository);

  Future<void> toggleTopic(String topic, bool isSubscribed) async {
    try {
      await checkNetworkConnection();
      if (isSubscribed) {
        await FirebaseMessaging.instance.subscribeToTopic(topic);
      } else {
        await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      }
      await _repository.setTopic(topic, isSubscribed);
      state = NoticeSettingModel(
        topics: {...state.topics, topic: isSubscribed},
      );
    } catch (e, stackTrace) {
      GlobalErrorHandler().handle(e, stackTrace);
    }
  }

  @override
  NoticeSettingModel build() {
    final savedTopics = {
      for (var tile
          in mainSettingSectionGroup.expand((section) => section.tiles))
        if (tile is SwitchTile)
          tile.topic: _repository.isSubscribed(tile.topic),
    };
    return NoticeSettingModel(topics: savedTopics);
  }
}

final noticeSettingProvider =
    NotifierProvider<NoticeSettingViewModel, NoticeSettingModel>(
  () => throw UnimplementedError(),
);
