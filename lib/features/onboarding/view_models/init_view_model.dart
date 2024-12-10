import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/fcm/repos/fcm_ropo.dart';
import 'package:jnu_alarm/features/onboarding/models/init_state_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitViewModel extends Notifier<InitState> {
  Future<void> initialize(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final fcmRepository = FcmRepository();

    final savedVersion = prefs.getInt('app_version');
    const currentVersion = 11; // 현재 앱 버전 (수동 관리 or package_info 사용)

    if (savedVersion == null) {
      // 앱 최초 실행
      await fcmRepository.initialize();
      // await _fcmRepository.setupBackgroundHandler();
      state = InitState(isFirstRun: true, isUpdated: false);
      // await prefs.setInt('app_version', currentVersion);
    } else if (savedVersion < currentVersion) {
      // 앱 업데이트 실행
      state = InitState(isFirstRun: false, isUpdated: true);
      await prefs.setInt('app_version', currentVersion);
    } else {
      // 일반 실행
      state = InitState(isFirstRun: false, isUpdated: false);
    }
  }

  @override
  InitState build() {
    throw UnimplementedError();
  }
}

final initProvider = NotifierProvider<InitViewModel, InitState>(
  () => InitViewModel(),
);
