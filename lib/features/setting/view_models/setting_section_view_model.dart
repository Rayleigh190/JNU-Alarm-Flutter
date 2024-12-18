import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/features/setting/constants/main_setting_const.dart';
import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';
import 'package:jnu_alarm/features/setting/repos/notice_config_repo.dart';

class SettingSectionViewModel extends Notifier<List<SettingSection>> {
  final NoticeSettingRepository _repository;

  SettingSectionViewModel(this._repository);

  Future<void> setDevMode(bool value) async {
    await _repository.setDevMode(value);
    if (_repository.isDevModeActivated()) {
      state = mainSettingSectionGroupWithDev;
    } else {
      state = mainSettingSectionGroup;
    }
  }

  @override
  List<SettingSection> build() {
    if (_repository.isDevModeActivated()) {
      return mainSettingSectionGroupWithDev;
    } else {
      return mainSettingSectionGroup;
    }
  }
}

final settingSectionProvider =
    NotifierProvider<SettingSectionViewModel, List<SettingSection>>(
  () => throw UnimplementedError(),
);
