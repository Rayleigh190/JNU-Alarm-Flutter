import 'package:jnu_alarm/features/setting/constants/setting_const_model.dart';

const SettingSection businessSettingSection = SettingSection(
  title: "각 사업단 홈페이지에 새 공지사항이 올라오면 알려드립니다.",
  tiles: [
    SwitchTile(
      title: "소프트웨어중심대학사업단",
      topic: "sojoong",
    ),
    SwitchTile(
      title: "인공지능혁신융합대학사업단",
      topic: "aicoss",
    ),
    SwitchTile(
      title: "차세대통신혁신융합대학사업단",
      topic: "nccoss",
    ),
    SwitchTile(
      title: "반도체특성화대학사업단",
      topic: "semi",
    ),
    SwitchTile(
      title: "이차전지특성화대학사업단",
      topic: "battery",
    ),
  ],
);

const List<SettingSection> businessSettingSectionGroup = [
  businessSettingSection,
];
