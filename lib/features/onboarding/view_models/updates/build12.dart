import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:jnu_alarm/common/database_helper.dart';
import 'package:jnu_alarm/features/notice/models/notice_model.dart';
import 'package:jnu_alarm/features/notice/repos/notice_repo.dart';
import 'package:jnu_alarm/features/onboarding/repos/intit_repo.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> build12Update() async {
  final fcmInfoRes = await InitRepository.fetchFcmInfo();
  try {
    // 1. 업데이트 유저인지 확인, api 사용
    // fcmInfoRes에서 파싱 오류나면 신규유저
    final topics =
        fcmInfoRes['response']['rel']['topics'] as Map<String, dynamic>;
    final topicKeys = topics.keys.toList();
    debugPrint("build12Update() - 구독 목록: $topicKeys");
    debugPrint("build12Update() - 기존유저");
    // 1-1. 구독 정보 가져와 topics와 각각 topic 저장
    final noticeSettingRepository =
        NoticeSettingRepository(await SharedPreferences.getInstance());

    for (String topic in topicKeys) {
      await noticeSettingRepository.setTopic(topic, true);
      await noticeSettingRepository.setSubscribedTopics(topic, true);
    }
    // // 1-2. 최근 3일 알림 가져와 저장
    final now = DateTime.now();
    final threeDaysAgo = now.subtract(const Duration(days: 3));
    final threeDaysAgoZero =
        DateTime(threeDaysAgo.year, threeDaysAgo.month, threeDaysAgo.day);
    final noticesRes =
        await NoticeRepository.fetchNotices(topicKeys, threeDaysAgoZero);
    for (NoticeModel notice in noticesRes.response.reversed) {
      await DatabaseHelper.insertNotice(notice);
    }
    debugPrint("build12Update() - 최근 3일 알림 저장: ${noticesRes.response}");
  } catch (e) {
    debugPrint("build12Update() - $e");
    debugPrint("build12Update() - 신규유저");

    // 2. 신규 유저이면
    // 2-1. 기본 알림 구독 처리
    final defaultTopics = ["basic"];
    Platform.isIOS ? defaultTopics.add("ios") : defaultTopics.add("aos");

    final noticeSettingRepository =
        NoticeSettingRepository(await SharedPreferences.getInstance());
    for (String topic in defaultTopics) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      await noticeSettingRepository.setTopic(topic, true);
      await noticeSettingRepository.setSubscribedTopics(topic, true);
    }
  }
}
