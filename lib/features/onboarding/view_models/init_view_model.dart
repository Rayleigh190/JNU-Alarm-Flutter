import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/fcm/repos/fcm_ropo.dart';
import 'package:jnu_alarm/common/network/network_connection_check.dart';
import 'package:jnu_alarm/features/onboarding/models/init_state_model.dart';
import 'package:jnu_alarm/features/onboarding/view_models/update_list.dart';
import 'package:jnu_alarm/features/onboarding/view_models/updates/build12.dart';
import 'package:jnu_alarm/features/onboarding/view_models/updates/build34.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitViewModel extends AsyncNotifier<InitState> {
  Future<InitState> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final fcmRepository = FcmRepository();

    final savedBuildNumber = prefs.getInt('build_number');
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final currentBuildNumber = int.parse(packageInfo.buildNumber);

    if (savedBuildNumber == null) {
      state = AsyncValue.data(InitState(loadingMeassage: "초기 설정"));
      // 인터넷 연결 확인
      await checkNetworkConnection();
      // 앱 최초 실행
      await fcmRepository.initialize();
      if (prefs.getString("last_notice_fetch_date") == null) {
        prefs.setString("last_notice_fetch_date", DateTime.now().toString());
      }
      // 추가로 해야 될 작업
      await build12Update();
      // UUID 생성 및 저장
      await build34Update();

      await prefs.setInt('build_number', currentBuildNumber);
      return InitState(isFirstRun: true, isUpdated: false);
    } else if (savedBuildNumber < currentBuildNumber) {
      state = AsyncValue.data(InitState(loadingMeassage: "업데이트"));
      await checkNetworkConnection();
      // 앱 업데이트 실행
      await updateApp(savedBuildNumber);
      await prefs.setInt('build_number', currentBuildNumber);
      return InitState(isFirstRun: false, isUpdated: true);
    } else {
      // await checkNetworkConnection();
      // 일반 실행
      return InitState(isFirstRun: false, isUpdated: false);
    }
  }

  @override
  Future<InitState> build() async {
    return await _initialize();
  }
}

final initProvider = AsyncNotifierProvider<InitViewModel, InitState>(
  () => InitViewModel(),
);
