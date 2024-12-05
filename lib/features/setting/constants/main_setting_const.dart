import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection basicSettingSection = SettingSection(
  title: "기본",
  tiles: [
    SwitchTile(title: "테스트1 알림", topic: "test"),
    NavigationTile(title: "바로가기 1"),
  ],
);

const SettingSection devModeSettingSection = SettingSection(
  title: "개발자 모드",
  tiles: [
    SwitchTile(title: "테스트2 알림", topic: "test2"),
    NavigationTile(title: "바로가기 2"),
  ],
);

const List<SettingSection> mainSettingSectionGroup = [
  basicSettingSection,
  devModeSettingSection,
];
